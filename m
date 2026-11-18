Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794965008;
	b=1ys7Slgk1P5CQ52iJOpNJV8G+LVeZCC6cXfnjfuQkk8VMDXD632iJBu1lRinF+t1Dbkn
	 wBCQbDZBaIlfi3J9p+EcD4gp34i3cwn1+Te5Yk4OIp+Iz44rHNqb/OMgRS63HyVKLjmWY
	 FJ8EzuZRsa9G9XT/jrLJpasnN2bx8IGyZqUp27pkYeveGaYNysqplYE0eS8l5+JBvVmys
	 t20qp1LMouuNCbJjM25s6jiMuPPgM/8BmnmgjpfgfzD5HeJHKcqXgTQK0sFFi/CXznxcP
	 Tk53H0y+UlDAFjpHhUbiesTPplFlcvrGwG+7MJvlm/1n+7mVDUEnEnokL/02SNMsgIw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794965008;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To;
	bh=7o1VbKJ1iahQrivXLihSnEzKkzZJ4LgIfigLzGHVz1Q=;
	b=ub44yB2yWwCLqEzZUDU1rcuIHsBxZf84wknIZwJkQ8t0nsaIfkrSP6rYDRkNtm/s0bYm
	 ZzvbLAIZmVz6tarsBZOYLFMy2aIw86VaaAtRR96niFPLbklT8rgUYDMbcz04OVIL1BiRU
	 VN0KsODKrXElrjDHORaKJDjLhAh/ysHBh/dmQaNrUKNvSU0bRnWxzZDTQCay9pgM0BzZp
	 wUBzuPc6svaeev3EVAWq+toi0+5X4s/Sx6Whzmsg1MrdKfabQWJgZZL43oUbz04xwQ56l
	 G1cIKYm+1d7MKGv6b/B5+mcBVejdX+Mm1PJ1BAzAeIUiadyE5RS5p24O1948/6ayFFg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=purestorage.com;
	spf=pass smtp.mailfrom=purestorage.com;
	dkim=pass header.d=purestorage.com header.i=@purestorage.com header.a=rsa-sha256 header.s=google2022 header.b=HI1piM8Z;
	arc=none smtp.remote-ip=74.125.82.45
Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28C1A606A32A
	for <sashiko-reviews@lists.linux.dev>; Wed, 18 Nov 2026 01:23:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 28C1A606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.a=rsa-sha256 header.s=google2022 header.b=HI1piM8Z
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-1b3ada81853so526006c88.0
        for <sashiko-reviews@lists.linux.dev>; Tue, 17 Nov 2026 17:23:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1794965007; x=1795569807; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=7o1VbKJ1iahQrivXLihSnEzKkzZJ4LgIfigLzGHVz1Q=;
        b=HI1piM8Z4EcycT6GW0eEo7/WsjXUGgW/FGlfz405noMkfIOKe72+1TPfnjYGs9uDQ8
         9RNzcd3L99a7+lA0RoRQC/bByVm4GNXJcFsxEKuOPsU4tEz7FA6BTm95hMtzYsPu7K4I
         dL14Tzan/cqx9xO9H8yspN95xncVxwcSjeUtHqHL9j3imvwyF7b6fSSZJHnxw4W6OoaI
         A9vGayderqshd0+7Zar3+STND6h+wbIn7gGb0Q1PKQhUk5aHd5ZXmrLlZ3huhigBlfHI
         QscpLx2Y+gdaaUkoTUhMxlZWN902rPRpMv+ORp3EXAiUVc8aunRDfL8gi+zxtSV26+95
         hL9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794965007; x=1795569807;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=7o1VbKJ1iahQrivXLihSnEzKkzZJ4LgIfigLzGHVz1Q=;
        b=CWZEMTowoAjt3A1tMU6+MztPn1V0rYp8oLkhc5wk566xKh8dbUGZY+ROLO+X6IO9jp
         iBHsHMXLPHK8oAIGq2oEV7yaXvSBesx7BkH/j/kpF1zc770PKlyfEAyg0KMzigmXs0Hs
         k+FXgRhzwzuuGRkWPFQz9fsG1Y8TEcAKl4BhWU29usq5oNAltzMbxayvzhiiq3Plf2aI
         AJ0MSVFWW6oH3RvfPLbFIkZn7aMklCqatHd+ul0y3VulLQt4+CqNnbTDkWoIGjqhiRL4
         ehsTkDSNVFowBouxzoEQb9GZtqNdn95EAn6IfJNshsBEQGSY2dYYkwpfPqhqIPlWwNeG
         +nYA==
X-Gm-Message-State: APuU4Z+O+5k2OdV4HAoSuPZY/A4ENdyIzuZ/pqXqvy86+hOVkfK+jMEx
	5Mexyg1lNOcKmJwHDhGNnfwR3kc3Ah8PsBA8tMbPNubb+UVrUWDdgPekReyJNSLBwcJMn+6Nz5U
	8/hB7eZKL/GoPu9LUYMJA0Tvifd1wYs1OX8X6QfkzVcHToCiJHi927iFjf7POhuYWd4kPJnQUxZ
	BJ3pC9/sXaU0YF5q+xmpdoZv4XmiTaW8VEePDXzurm36Nu/UGF95S7jVS2skQvQas=
X-Gm-Gg: AYBFou3/EGcDFFxmuG9hAC1Pd+xnRJ76egqNUhmun7pIuXnhMxp89uo0eHOBF4rL0wk
	2ZuNrEp4dYSxFZ2ECRRkE+Nu7s3HQbY+oNESDcvx+lKUPC5y+p9t26gw1pMM5jRB2HI/bnIDAI4
	TVLkYA4tvzVd/fMSPEXRVh9iCcaIf5sxlirOT7dMoXfqD7vlZe2eoz/zhMX/SPC7PHw3rYhFUru
	ur79KUxn1godsLT7gMP+cMEeYLkJbyJ9KbdmLAu3RXM8qeW1NHdT7gAFExItxz8f6KuvBdxUwPP
	CD+d55i33GkboAVI5oV3ZW2x28hjTGsHvufywpqJjXHkBDi2Tg2kDfY9B0j0v3pJDvlW6eB8khF
	MABb4Nu9eWoJTi2d5nTwNEe9/RXBPYFftR2NZ/sabKdqUSPbhfg3Pr9trdphMQqPAVYCFj2Sd9Y
	AuGCykC+G5VgNAvE6jipuG7EvdwL+FmRXaVC/52+kpYqMOLUQqcVZGCbid6LaraRsIrBd2wcCzK
	HN+a2SnwI3aHYAPI1r0DHvdYsP9tt5nGtDaZgV1hrkFp+ed4RD6DXmn63jvAn/6ZrbG8fFpJArJ
	ebrsWBxEQRj89NzlLNU9IdOsBjwvGEw5BhW3YI3+IibJIQ3Y45s=
X-Received: by 2002:a05:701b:231a:b0:169:9f67:a91b with SMTP id a92af1059eb24-1b543cb5347mr981657c88.12.1794965006461;
        Tue, 17 Nov 2026 17:23:26 -0800 (PST)
Received: from medusa.lab.kspace.sh ([208.88.152.253])
        by smtp.googlemail.com with ESMTPSA id 5a478bee46e88-382a63059e3sm2630107eec.5.2026.11.17.17.23.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 17:23:25 -0800 (PST)
Date: Tue, 17 Nov 2026 17:23:24 -0800
From: Mohamed Khalfella <mkhalfella@purestorage.com>
To: sashiko-reviews@lists.linux.dev
Cc: linux-nvme@lists.infradead.org
Subject: Re: [PATCH v7 09/17] nvme: Implement cross-controller reset
 completion
Message-ID: <20261118012324.GH1670230-mkhalfella@purestorage.com>
References: <20261114030454.2836543-1-mkhalfella@purestorage.com>
 <20261114030454.2836543-10-mkhalfella@purestorage.com>
 <sashiko-outbox-214111@kernel.org>
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <sashiko-outbox-214111@kernel.org>

On Sat 2026-11-14 03:29:37 +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [High] nvme: UAF and deadlock in nvme_ccr_work() when controller is
>   not LIVE
> --
> 
> commit ccb451fbdaf89eaa6e4be835d2b43da8b0854559
> Author: Mohamed Khalfella <mkhalfella@purestorage.com>
> 
> nvme: Implement cross-controller reset completion
> 
> This commit adds ctrl->ccr_work and handles NVME_AER_NOTICE_CCR_COMPLETED
> events by reading the NVME_LOG_CCR log page and completing matching entries on
> ctrl->ccr_list.
> 
> > diff --git a/drivers/nvme/host/core.c b/drivers/nvme/host/core.c
> > index 27c33dc49175e..54b83092a9e8f 100644
> > --- a/drivers/nvme/host/core.c
> > +++ b/drivers/nvme/host/core.c
> [ ... ]
> > @@ -5060,6 +5061,48 @@ static void nvme_get_fw_slot_info(struct nvme_ctrl *ctrl)
> >  	kfree(log);
> >  }
> >  
> > +static void nvme_ccr_work(struct work_struct *work)
> > +{
> > +	struct nvme_ctrl *ctrl = container_of(work, struct nvme_ctrl, ccr_work);
> > +	struct nvme_ccr_entry *ccr;
> > +	struct nvme_ccr_log_entry *entry;
> > +	struct nvme_ccr_log *log;
> > +	int num_entries, ret, i;
> > +	unsigned long flags;
> > +
> > +	log = kmalloc_obj(*log);
> > +	if (!log)
> > +		return;
> > +
> > +	ret = nvme_get_log(ctrl, 0, NVME_LOG_CCR, 0x01,
> > +			   0x00, log, sizeof(*log), 0);
> 
> [Severity: High]
> Can nvme_ccr_work() submit a Get Log Page command to a destroyed or quiesced
> ctrl->admin_q when the controller is no longer live?
> 
> During controller deletion, nvme_do_delete_ctrl() calls nvme_stop_ctrl()
> before ctrl->ops->delete_ctrl() stops the admin queue, and
> nvme_uninit_ctrl() runs only after nvme_remove_admin_tag_set() has already
> destroyed ctrl->admin_q and freed ctrl->admin_tagset.  If an in-flight AEN
> completes with NVME_AER_NOTICE_CCR_COMPLETED after nvme_stop_ctrl() cancels
> ctrl->ccr_work, nvme_ccr_work() is re-queued and can access ctrl->admin_q
> while or after it is destroyed:
> 
> CPU0                                  CPU1
> nvme_do_delete_ctrl()
>   nvme_stop_ctrl()
>     cancel_work_sync(&ctrl->ccr_work)
>                                       nvme_complete_async_event()
>                                         nvme_handle_aen_notice()
>                                           queue_work(nvme_wq, &ctrl->ccr_work)
>   ctrl->ops->delete_ctrl()
>     ...
>     nvme_remove_admin_tag_set()
>       blk_mq_destroy_queue(ctrl->admin_q)
>       blk_mq_free_tag_set(ctrl->admin_tagset)
>                                       nvme_ccr_work()
>                                         nvme_get_log(ctrl, ...)
>                                           <-- use-after-free on admin_q
>   nvme_uninit_ctrl()
>     cancel_work_sync(&ctrl->ccr_work)
> 
> Because nvme_ccr_work() does not check nvme_ctrl_state(ctrl) ==
> NVME_CTRL_LIVE, it can also run while ctrl->admin_q is quiesced during reset
> or transport error recovery; nvme_get_log() then blocks in blk_execute_rq()
> waiting for the queue to be unquiesced, and the next nvme_stop_ctrl() ->
> cancel_work_sync(&ctrl->ccr_work) deadlocks before teardown can unquiesce
> ctrl->admin_q.
> 
> Checking nvme_ctrl_state(ctrl) != NVME_CTRL_LIVE at the start of
> nvme_ccr_work() (like nvme_ana_work() and nvme_scan_work()) and cancelling
> ctrl->ccr_work in nvme_remove_admin_tag_set() before destroying
> ctrl->admin_q would avoid both issues.

Good point. Adding nvme_ctrl_state(ctrl) != NVME_CTRL_LIVE should be
enough to close this race window becauwe we cancel the work twice.
I will update the code to do that.

> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20261114030454.2836543-1-mkhalfella@purestorage.com?part=9
