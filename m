Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7718840DB4B
	for <sashiko-reviews@lists.linux.dev>; Wed, 12 Aug 2026 11:29:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786534185; cv=none; b=A56SQ5gmSkdw2f9hzCP2x4iuPKg/lWDseggOwIk0NJL2YSIgBVulyChZ6Z3eygXsiI1h8CVBwSDEPp7m2q8fzqxOFEyZcmGiTTNpDq5/bxY0dCl+ulIjz9NB3upRYSTcy02QnGx6vsAL3tjSVEMQTgEJxXEIh/Dvaj+pff56nbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786534185; c=relaxed/simple;
	bh=J5qQg2sgPSp5ug0RQjQNqqEcAlSDBcR8J0nLpJRI3n8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=sNdRjsClAtc/IldLJV3PYq6HL/lGRerALsTI9kTL8G70L3LRDnahrdULl19KlwxuiakqxvbBPTWOrH+Pm3W0yPhJpzJx+D20VTKaOIX7sYcMARvWAOzyEZhUbzAHVNoe83tDXepDZ72wIBCAal+Ph+naW8fNZWkrO3rPQRhG838=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=IAkiRLW3; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="IAkiRLW3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1786534182;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Au0NrUwn9ekws0t3rfHDWqY58j+n7hjhM+HaCR8gx9A=;
	b=IAkiRLW3Zxc1Lspt04KHuZIOvPGUcVRN/VhFAdoCkmGo4M+l9qqecKM127HV0/ETZGUcpD
	8BtCkZlNkUP6XLfPNuFlI81w5j1ep+Ohi7tm+wuPYql3cZlDRnROb4mBsIohILbh60i59J
	6a64Eh1GCDSr+QOVUI+J/BRkx/5PUWw=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-562-0dcrssxjNgaCzCmlVijpXQ-1; Wed, 12 Aug 2026 07:29:41 -0400
X-MC-Unique: 0dcrssxjNgaCzCmlVijpXQ-1
X-Mimecast-MFC-AGG-ID: 0dcrssxjNgaCzCmlVijpXQ_1786534180
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38dc085b0a7so1800717a91.2
        for <sashiko-reviews@lists.linux.dev>; Wed, 12 Aug 2026 04:29:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786534180; x=1787138980;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Au0NrUwn9ekws0t3rfHDWqY58j+n7hjhM+HaCR8gx9A=;
        b=neF7M/t/3PrDsDnwAzOO5q0AeXLIFbWvtwy/IAq2QIlpCC8jW+sp33GWcabVIF+Umm
         5RHWMVE5L8I7/px65LvvXz6NJFvynEoJvH6BWcaoMVCaucG+hHnTZG0LQoc4HVZMbZOU
         sjQaerWumzdDuhnnbZ128C55bcynoHZTX+OMa9DRl2kiPttMmB0PAOTatcuFK2eKs1Kj
         SP0+6X3YRa5pytIPkFSP4+3bNGkNXYOLyQIEavk+UjB6/v9OZk1pJu8eKRFMmvKSECER
         bDgfbC7fqjbMVCThTkkcOiVf1r2HDT4OVWI98D8BsyI/kRYfbHUaGdBsW3jQoZ+14iFk
         u+WA==
X-Gm-Message-State: AOJu0Yw/0Rj5gK5sD8qppnMmhFY8w/Glyb5AJcbsdL38+ny22LLjmsYt
	WeSMzX6skHKR0n4i+UDQ0+Bg7kCIiXe7AWXha8cwhtzhVtZDZYbBd8qepewwZ02YWozcqUKYGZA
	bqR4VtsAxAVMDvCUTod/AXTIAQHjHf4IlAgKgeigaHKa+5YdP67fEe1qSYmwZlNy55KnPiQRQN+
	AhmNfI8Ak5VkBm9w2vqYjQ9JjVQHzLjSBdf85bJtsy0FAXqIsa3TiNhho=
X-Gm-Gg: AR+sD13Uq5jsWzmJGxa7+7/CeON69N+PusUiuDG4CbRAFAvq+pPjJZcrvu9urCi+jfW
	1SUQgdknU99Xy/bqsQPaQkgheqVKYQfO7p5YCb1SUdWp+nv4QRbKTlyrt3qvDaH1rqjiWTOoqbZ
	PsUWcMfzVjXILu/hJqa6wsgM9TiNk+Z3z0gSYSmxQ8e5EcaJKs7YdZdz5ovknpCfZBGuMeXVwP0
	JllHdWNahakKHbsPnD4kq0kFMmf46fEYVVhBEIORWahG6HSa1LEkbB2gxi5Lpnp1RTmxtxwGiz6
	wufILIaqz4Uc0Hy0mtTGtp8+SvwMX27kqMhvUG04GFuQSyA1hC+EY/FktRDRJfRNI2dQO6MfJSB
	MqykUR0LQ/jDljO0GHClnayXp72JA25UO+Y6iklNWdjtXy6UFbDTXc4LN8NVg7mSrpSG4
X-Received: by 2002:a17:90b:5828:b0:38e:5964:97a8 with SMTP id 98e67ed59e1d1-393014c10cemr5553499a91.16.1786534180059;
        Wed, 12 Aug 2026 04:29:40 -0700 (PDT)
X-Received: by 2002:a17:90b:5828:b0:38e:5964:97a8 with SMTP id 98e67ed59e1d1-393014c10cemr5553407a91.16.1786534179387;
        Wed, 12 Aug 2026 04:29:39 -0700 (PDT)
Received: from mgandhi-thinkpadp16vgen1.punetw6.csb ([2401:4900:88fa:3d3d:2349:1310:a2eb:9912])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-392fe4f9079sm829631a91.3.2026.08.12.04.29.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 04:29:38 -0700 (PDT)
Date: Wed, 12 Aug 2026 16:59:32 +0530
From: "Milan P. Gandhi" <mgandhi@redhat.com>
To: sashiko-reviews@lists.linux.dev
Cc: linux-scsi@vger.kernel.org, sathya.prakash@broadcom.com,
	kashyap.desai@broadcom.com, sumit.saxena@broadcom.com,
	sreekanth.reddy@broadcom.com, James.Bottomley@hansenpartnership.com,
	martin.petersen@oracle.com
Subject: Re: [PATCH 1/2] scsi: mpi3mr: Fix NULL pointer dereference in
 mpi3mr_sas_port_add()
Message-ID: <anxZHBo9tOMvbmcu@mgandhi-thinkpadp16vgen1.punetw6.csb>
References: <20260812103344.174247-1-mgandhi@redhat.com>
 <20260812103344.174247-2-mgandhi@redhat.com>
 <20260812104334.CDC5E1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20260812104334.CDC5E1F000E9@smtp.kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: dEP2J4R26-RRehitn-SL8r0-j1mvPnr5MbQuC93HNUc_1786534180
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Wed, Aug 12, 2026 at 10:43:34AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> 
> Pre-existing issues:
> - [High] Missing NULL check for the return values of sas_end_device_alloc() and sas_expander_alloc().
> - [High] Ignored return value of sas_rphy_add() leads to a resource leak and invalid system state.
Thanks for the automated review. 

The flagged rphy NULL check and sas_rphy_add() error handling are
pre-existing issues in mpi3mr_sas_port_add(). 

I will keep this 2-patch series focused on fixing the sas_port allocation/free 
bugs and target device refcount leak, and I will look into addressing the 
rphy error handling in a separate follow-up patch.

Thanks,
Milan
> --
> 
> --- Patch [1]: [PATCH 1/2] scsi: mpi3mr: Fix NULL pointer dereference in mpi3mr_sas_port_add() ---
> commit 52d7de23ae9ec8ed8dec5b684daecf405f00a60e
> Author: Milan P. Gandhi <mgandhi@redhat.com>
> 
> scsi: mpi3mr: Fix NULL pointer dereference in mpi3mr_sas_port_add()
> 
> sas_port_alloc_num() can return NULL on memory allocation failure, which
> causes a NULL pointer dereference when passed to sas_port_add().
> Additionally, if sas_port_add() fails, the allocated port is leaked.
> This patch adds a NULL check and calls sas_port_free() on failure.
> 
> > diff --git a/drivers/scsi/mpi3mr/mpi3mr_transport.c b/drivers/scsi/mpi3mr/mpi3mr_transport.c
> > index 240f67a8e2e3b..ea2c04384a0e1 100644
> > --- a/drivers/scsi/mpi3mr/mpi3mr_transport.c
> > +++ b/drivers/scsi/mpi3mr/mpi3mr_transport.c
> > @@ -1428,9 +1428,15 @@ static struct mpi3mr_sas_port *mpi3mr_sas_port_add(struct mpi3mr_ioc *mrioc,
> >  	}
> >  
> >  	port = sas_port_alloc_num(mr_sas_node->parent_dev);
> > +	if (!port) {
> > +		ioc_err(mrioc, "failure at %s:%d/%s()!\n",
> > +		    __FILE__, __LINE__, __func__);
> > +		goto out_fail;
> > +	}
> >  	if ((sas_port_add(port))) {
> >  		ioc_err(mrioc, "failure at %s:%d/%s()!\n",
> >  		    __FILE__, __LINE__, __func__);
> > +		sas_port_free(port);
> >  		goto out_fail;
> >  	}
> >  
> 
> Further down in drivers/scsi/mpi3mr/mpi3mr_transport.c:mpi3mr_sas_port_add():
> 
> 	if (mr_sas_port->remote_identify.device_type == SAS_END_DEVICE) {
> 		rphy = sas_end_device_alloc(port);
> 		tgtdev->dev_spec.sas_sata_inf.rphy = rphy;
> 	} else {
> 		rphy = sas_expander_alloc(port,
> 		    mr_sas_port->remote_identify.device_type);
> 	}
> 	rphy->identify = mr_sas_port->remote_identify;
> 
> [Severity: High]
> This isn't a bug introduced by this patch, but does this code lead to a NULL
> pointer dereference if memory allocation fails? If sas_end_device_alloc() or
> sas_expander_alloc() returns NULL, it appears we dereference rphy directly on
> the following line without checking it.
> 
> 	if ((sas_rphy_add(rphy))) {
> 		ioc_err(mrioc, "failure at %s:%d/%s()!\n",
> 		    __FILE__, __LINE__, __func__);
> 	}
> 
> [Severity: High]
> This is a pre-existing issue, but does ignoring the return value of
> sas_rphy_add() here lead to resource leaks and invalid system state?
> 
> The failure is only logged, and execution continues without aborting or
> cleaning up the rphy. If we leave an unregistered device in the state
> structures, could it cause an oops during teardown?
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260812103344.174247-1-mgandhi@redhat.com?part=1
> 

