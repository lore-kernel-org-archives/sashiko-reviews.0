Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794873246;
	b=MZWDhzivOD2dHBZJ/RrfASAUNcQDNfph6CN+56ZjLIk26RvYFQA3VBdvzsLmKStFVAAf
	 9eKS5RUe9U2/w9Z+XTcvKey5O7Js7W/+OPaPJ1Se0l677zPgv8oA/2EB35KyNuuC6HLQK
	 BWCwsvYTThfMJyUO42AVfYSikC0ihofjEKCIeGNfpQD93PtRJhNphmnC6toXHTj3cXCHe
	 ZfyUsjpJRm5VOIIyylDxtuNefDhn4zTdDTGMrGPJM2kzoWgEywZgJfnKHPyw3VH4qlT4f
	 3qvjgDlAvWMJTiDV5Ha2/00OFK7ABEImjZCDK1pqvsLdSzOXC1HtY7TWmKBKr2eHnYQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794873246;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To;
	bh=xV4hGNRv/ke1OuTNrqmu+aBd7MFTgTP4hspbNlDMV+A=;
	b=b4BE/N7gnaYcWSfU5lGLFRhxBYdbkpeMI77OeNve77vqPVHuPy3QYNy8cJAXQMccApHa
	 PeQEvNPv7qXhOt1IgXrJfvcNhPBHBF8wAhH0vPbNWOocqUyqcKZZ8nogq2C7VNW3sCBq6
	 InMs+NgQJ57KyeJnGcT//SFUiIpgnblFmC89LlzOxD8bQ4G8hlX261JaN+gqLfDhtp2r4
	 +flPEHkCEyRjDZlBNdCue4WMfCEHl3zqU/Fm4GvmCZOuYiDrsv63ZoO+HjyKivKER2Pxl
	 CBbsexAjqS32OZQrI8pi0spDlWcc7xFYcln6Z+Xrg7lNdkYT5lHg7P2U6NVhvy21MQw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=purestorage.com;
	spf=pass smtp.mailfrom=purestorage.com;
	dkim=pass header.d=purestorage.com header.i=@purestorage.com header.a=rsa-sha256 header.s=google2022 header.b=BvC3C7sJ;
	arc=none smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9654606A31C
	for <sashiko-reviews@lists.linux.dev>; Mon, 16 Nov 2026 23:54:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D9654606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.a=rsa-sha256 header.s=google2022 header.b=BvC3C7sJ
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-38133db970bso476837eec.0
        for <sashiko-reviews@lists.linux.dev>; Mon, 16 Nov 2026 15:54:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1794873245; x=1795478045; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xV4hGNRv/ke1OuTNrqmu+aBd7MFTgTP4hspbNlDMV+A=;
        b=BvC3C7sJsNvxZUmEhgmWPZ6mHFkgT1F0aBfpgAU4FzLkO3o4j1EPya8GiPDGH/qsyj
         Vsr73bYBbpHF0xrFWpCkYvCs++0KwShVfLPFexIYqO6QUJPqkSGT8dUqebaIQndXJxE4
         xFTZahisHGBzXureNZU+2cbzceoq/XYneTQgCZFpIKXAzMkAvY0f7pBHoKArW3SmV7KB
         jBny87ozySwHcqGIZWHBhGXPT5+w9OgbR0Fa04rPpIXRjGMCUKo/FRElwHhpXZxrXzcj
         k97ZN8PBwxrXQT148N3hXnNLyVeIta1oPcQg6xMNSRqDDXF51X2Z0NNdC1R2/SG+Ebjc
         4Y4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794873245; x=1795478045;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=xV4hGNRv/ke1OuTNrqmu+aBd7MFTgTP4hspbNlDMV+A=;
        b=RFJ8f2yVK2l94SQeIo1s/vAxRL7lz8ABiUurcL4A/i9rji6nLMIrDXjoNmIQnXJhJi
         JjoKtquUWZA+wrxBBJWgXEXTBcfVFKJkv5iArvNHhSWxQcJdsalaEkykSgE1H0ruzyen
         rdtu50AMxju6KTGvvgd6XhkLHpkUGMM2DD7fJs+8jy0dBC31qKCcMfXPoED5XwS1cdGa
         U3QPkbl9YS5XeRYZwqU+WfjUF3KYXb7GdPS+6NvojxpXPj1ZJiH4usdzI2n/jpu2476p
         7uo+xwqnAE54LebJJtAUvP+qt2lsJqa41Lr+QoPvc7zUXkLxBAPxNnA5h79jT+KtFQgP
         ysbA==
X-Gm-Message-State: APuU4Z/Q1dQ2zPRBLuzm3FnSEInXwv1sHZRw53s0wdEM+j9k0IV0QuYV
	+IJDbZfuWdgAP9LFJHw9ZpK89sFeRvSVhXRJ1F+8NFrSDR/5UV3X84KNsqMiiKbrAqodIdwamDe
	ssKykkoIq+5pFLF7IKUVsN1P6x9tekxxLhZfDlNoWSyEkENppHsM91rSY9wARKExQE27yLiSNRQ
	64In6Sjk+HvKcXVSNDIoL5YgEMzjKJ1ckbllMy6+nukUhnyc3SsEMsPGBWZ4HK
X-Gm-Gg: AZFdTZd8B4HMbR50MHN+5xllZ1QHVOxNxOYAk2DYyU9GuatiBWivSXeXvwAOIX+05Kx
	5d+s2DmouibJDmm/CNqFsOOMLnVSv3jMj21YmKGiUuzXMBA1DtlxBpCZ8g/J2jKHb07GR2EBCK3
	KnG/1r3fxui1C1KBAFvTV1X1Hit00CB3dByZVBBmU0Zhu4mzrm/mZMuNt9zF4selc3ab5toJ9eM
	7SFRG/wMD1A9wboRMxl+kVDyXI+WBGi0n8OfEhbtCHZpegrPOcwcxKAkYuyFqnChvTkX0YZhZol
	5uuMxDPoDWEMxH5HjoftE69gYR5SvM7JUMfdT4/hJc450PlpfrrITOwytdRf/8QnTZsq0aU5E34
	z/jXJD4k2T8W7Z5sBjIXL/oFKkwyHWOo1IhtySYboJVkTYlHN6NsX7IeqT3McB3iLzwqcOH91iK
	IeOJtMCmCrnVdNr4gQBdtkA2W/eTod1DOBuZrsWsrWrgtSJuE5yIOHKZpoCLK6akQlJy8GQKjGH
	jJefqYLBWYmmk8rqRsVlgHGqHANG59Zk4U6meTsT0kX8YOVnxkYfYtHz//lAZKd6dc8izpeUUy1
	4pkoyREYCbgpBogiLBobOHWHxXubg3MGYi+we9JeniVm0mWTgNM=
X-Received: by 2002:a05:7300:540f:b0:380:c3d7:c263 with SMTP id 5a478bee46e88-380c3d7c590mr2343761eec.5.1794873244352;
        Mon, 16 Nov 2026 15:54:04 -0800 (PST)
Received: from medusa.lab.kspace.sh ([208.88.152.253])
        by smtp.googlemail.com with ESMTPSA id 5a478bee46e88-37956bad134sm46028299eec.27.2026.11.16.15.54.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 15:54:03 -0800 (PST)
Date: Mon, 16 Nov 2026 15:54:02 -0800
From: Mohamed Khalfella <mkhalfella@purestorage.com>
To: sashiko-reviews@lists.linux.dev
Cc: linux-nvme@lists.infradead.org
Subject: Re: [PATCH v7 03/17] nvmet: Implement CCR nvme command
Message-ID: <20261116235402.GC1670230-mkhalfella@purestorage.com>
References: <20261114030454.2836543-1-mkhalfella@purestorage.com>
 <20261114030454.2836543-4-mkhalfella@purestorage.com>
 <sashiko-outbox-214113@kernel.org>
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
In-Reply-To: <sashiko-outbox-214113@kernel.org>

On Sat 2026-11-14 03:30:43 +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [Medium] nvmet: TOCTOU race between nvmet_ctrl_find_get_ccr() and
>   nvmet_start_ctrl()
> --
> 
> commit 8afa887480a9e0f0751311107895be0ad6ed159f
> Author: Mohamed Khalfella <mkhalfella@purestorage.com>
> 
> nvmet: Implement CCR nvme command
> 
> This commit implements the Cross-Controller Reset admin command for the
> NVMe target, allowing a source controller to look up and trigger a fatal
> error on an impacted controller matching the specified controller ID, ciu,
> and cirn.
> 
> > diff --git a/drivers/nvme/target/admin-cmd.c b/drivers/nvme/target/admin-cmd.c
> > index 5710ae53eb83a..3df9db454db9c 100644
> > --- a/drivers/nvme/target/admin-cmd.c
> > +++ b/drivers/nvme/target/admin-cmd.c
> [ ... ]
> > @@ -1629,6 +1630,78 @@ void nvmet_execute_keep_alive(struct nvmet_req *req)
> >  	nvmet_req_complete(req, status);
> >  }
> >  
> > +void nvmet_execute_cross_ctrl_reset(struct nvmet_req *req)
> > +{
> [ ... ]
> > +	/* Find and get impacted controller */
> > +	ictrl = nvmet_ctrl_find_get_ccr(sctrl->subsys, sctrl->hostnqn,
> > +					cmd->ccr.ciu, cntlid,
> > +					le64_to_cpu(cmd->ccr.cirn));
> [ ... ]
> > +out_unlock:
> > +	mutex_unlock(&sctrl->lock);
> > +	if (status == NVME_SC_SUCCESS)
> > +		nvmet_ctrl_fatal_error(ictrl);
> > +	nvmet_ctrl_put(ictrl);
> > +out:
> > +	nvmet_req_complete(req, status);
> > +}
> [ ... ]
> > diff --git a/drivers/nvme/target/core.c b/drivers/nvme/target/core.c
> > index 9c9ad4d9b292d..86018e0fb1586 100644
> > --- a/drivers/nvme/target/core.c
> > +++ b/drivers/nvme/target/core.c
> [ ... ]
> > @@ -1432,6 +1446,7 @@ static void nvmet_start_ctrl(struct nvmet_ctrl *ctrl)
> >  	if (!nvmet_is_disc_subsys(ctrl->subsys)) {
> >  		ctrl->ciu = ((u8)(ctrl->ciu + 1)) ? : 1;
> >  		ctrl->cirn = get_random_u64() ? : 1;
> > +		nvmet_ctrl_cleanup_ccrs(ctrl, false);
> >  	}
> >  	ctrl->csts = NVME_CSTS_RDY;
> >  
> > @@ -1537,6 +1552,42 @@ struct nvmet_ctrl *nvmet_ctrl_find_get(const char *subsysnqn,
> >  	return ctrl;
> >  }
> >  
> > +struct nvmet_ctrl *nvmet_ctrl_find_get_ccr(struct nvmet_subsys *subsys,
> > +					   const char *hostnqn, u8 ciu,
> > +					   u16 cntlid, u64 cirn)
> > +{
> > +	struct nvmet_ctrl *ctrl, *ictrl = NULL;
> > +	bool found = false;
> > +
> > +	mutex_lock(&subsys->lock);
> > +	list_for_each_entry(ctrl, &subsys->ctrls, subsys_entry) {
> > +		if (ctrl->cntlid != cntlid)
> > +			continue;
> > +		if (strncmp(ctrl->hostnqn, hostnqn, NVMF_NQN_SIZE))
> > +			continue;
> > +
> > +		/*
> > +		 * Enabling the controller regenerates ciu and cirn under
> > +		 * ctrl->lock. Hold the lock so that a controller becoming
> > +		 * ready concurrently is matched against either the old or
> > +		 * the new instance, never a mix of both.
> > +		 */
> > +		mutex_lock(&ctrl->lock);
> > +		if (ctrl->ciu == ciu && ctrl->cirn == cirn)
> > +			found = true;
> > +		mutex_unlock(&ctrl->lock);
> 
> [Severity: Medium]
> Can nvmet_execute_cross_ctrl_reset() race with nvmet_start_ctrl() and
> trigger a fatal error on a newly enabled controller instance?
> 
> nvmet_ctrl_find_get_ccr() drops ctrl->lock right after matching ctrl->ciu
> and ctrl->cirn.  Before nvmet_execute_cross_ctrl_reset() calls
> nvmet_ctrl_fatal_error(ictrl), a concurrent nvmet_update_cc() can enable
> ictrl and advance ictrl->ciu and ictrl->cirn:
> 
> CPU0                              CPU1
> nvmet_execute_cross_ctrl_reset()
>   nvmet_ctrl_find_get_ccr()
>     mutex_lock(&ictrl->lock)
>     /* matches ciu and cirn */
>     mutex_unlock(&ictrl->lock)
>                                   nvmet_update_cc()
>                                     mutex_lock(&ictrl->lock)
>                                     nvmet_start_ctrl()
>                                       ictrl->ciu = ...;
>                                       ictrl->cirn = ...;
>                                     mutex_unlock(&ictrl->lock)
>   nvmet_ctrl_fatal_error(ictrl)   <-- kills the new instance
> 

If ictrl matches cntlid, ciu, and cirn then it is our controller we want
to reset. There is nothing wrong here. Even if ictrl changes its ciu,
cirn it is still the controller we want to reset.

> If the interleaving goes the other way and nvmet_ctrl_fatal_error(ictrl)
> runs just before nvmet_start_ctrl(), nvmet_start_ctrl() overwrites
> ictrl->csts with the ready state, clearing the fatal status bit while
> ictrl->fatal_err_work is already queued.

That should not be a big issue. The controller is being deleted anyway.

> 
> In addition, when a controller is re-enabled in-place via
> nvmet_start_ctrl() rather than freed in nvmet_ctrl_free(),
> nvmet_start_ctrl() only cleans up entries on ctrl->ccr_list where ctrl was
> the source controller, leaving pending entries on other controllers where
> ctrl was the impacted controller active with a non-null ccr->ctrl pointer.

This is intentional. NVM-Express Base Specification Revision v2.4
section 5.2.13.3.1 Cross-Controller Reset (Log Page Identifier 1Eh)
states that completed CCR operations (ccr->ctrl == NULL) should be
cleared from CCR logpage when a controller is reset. Pending entries do
survive controller reset.

> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20261114030454.2836543-1-mkhalfella@purestorage.com?part=3
