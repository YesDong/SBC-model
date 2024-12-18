# -*- coding: utf-8 -*-
"""
Created on Thu Oct 12 11:02:07 2023

@author: wh
"""


import numpy as np
import torch
from torch.utils.data import Dataset

from torch import nn
from torchmeta.modules import (MetaModule, MetaSequential)


class model(MetaModule):

    def __init__(self, num_users=1, type='relu', 
                 hidden_features=256, num_hidden_layers=3, **kwargs):
        super().__init__()

        self.A = nn.Embedding(num_users, 5)
        self.lamda = nn.Embedding(num_users, 5)
        print(self)

    def forward(self, model_input, params=None):

        times = model_input['ti']
        uids = model_input['ui']
        Ai = self.A(uids[:,0].long())
        lamdai = self.lamda(uids[:,0].long())
        opinion = torch.sum( Ai * torch.exp(lamdai * times), -1 )
        output = opinion.unsqueeze(-1) 

        return {'opinion': output}

    def forward_with_activations(self, model_input):
        '''Returns not only model output, but also intermediate activations.'''
        times = model_input['times'].clone().detach().requires_grad_(True)
        activations = self.net.forward_with_activations(times)
        return {'opinion': activations.popitem(), 'activations': activations}



def loss_function(model_output, gt, loss_definition="MAE"):
    '''
       x: batch of input coordinates
       y: usually the output of the trial_soln function
       '''
    gt_latent_opinion = gt['opinion']
    pred_latent_opinion = model_output['opinion']

    data_loss = (pred_latent_opinion - gt_latent_opinion)**2

    # Exp      # Lapl
    # -----------------
    return {'data_loss': data_loss.mean(), 
           }



