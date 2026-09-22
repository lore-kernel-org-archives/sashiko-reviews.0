Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACED7556BA2
	for <sashiko-reviews@lists.linux.dev>; Tue, 22 Sep 2026 15:34:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790091298; cv=none; b=lbbA6PWXVEWkaLDzOf6DL+s3JJRLH6YQaSwuVhalsonnnRRQCWuLIWmpDLWsEYFSz2ZXkxqoY7qyOUsm16rMn1zdggNRz9LCvvTs8PzBAn88iAUpBaLbE6cpKHRqVFGP5APJhL0/XCuh5qhNnHS0qRitvJ9vRpD9Maa8l65svjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790091298; c=relaxed/simple;
	bh=AlI+gYgyGWjTDG8mZPpqNZoJRCkR2l4HAii3muE5ymY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VfMAFtXid6xFfuR+l/1IrrxQ4F96PUibfXKW0PEt0VDq1Nk90AtxngK7KoFSyAVvXSy/Q05X6PeeZuhDLAeah+2r+eysVxdU1oRJV5HixaUjsWlDRlgVZR9HSGkLyBoaOb83rXb58bWD8q34Iqq4NDxAFB3fQzynCd7ij25WMnY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=L1GoHgwE; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="L1GoHgwE"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-498012a61f6so48205e9.0
        for <sashiko-reviews@lists.linux.dev>; Tue, 22 Sep 2026 08:34:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790091294; x=1790696094; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=BNyTVQyFI7mOSGhaMtyppzYBxtzn1iFq72gMT4Q0GAo=;
        b=L1GoHgwE4fvvat6r7a8ETLOqFyReBS6Ju1QHSuEOxx2xmo+wvvgj6sdxEl3iessWiX
         G9z+Mq2WPoGWITxJiMYsJ7fqhESvrJZzCvuP8iRu5mHjbQVL11/8AkQRC1nsyWfHF0Im
         CIABaP0fVzfsVym3W7QQmDiNkVlPB1RSOUIqtEM7Xt+dKrx07nFZrf4y2ef+HaM/p5aI
         jf7kBkpb3Lzk1jtoei+/Mg1lXBUwFuAJ074pt600P6OZG1ZkGx7/mMFQRcXqNuue0tgr
         uqXHAFZskohlCMac6T86yQWabP8gauHimtPGTTpY0kC0cioINLYJA8SZ3c0FLUeIdpBJ
         kZiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790091294; x=1790696094;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=BNyTVQyFI7mOSGhaMtyppzYBxtzn1iFq72gMT4Q0GAo=;
        b=VY/O4PndciZzbNnJPtpvuSLxaPYn73xcxjRaRvc2wUZHtjhMUixHZa6J6Eh5jv8qLz
         RgIf82HmrqCv0nM5poQ2BPbx1d6bnMpdNaAx86N0qMA8sMn2DGZXVCWmFiybE2wetu4T
         lm/b8RjEt3oTUSt0YZOHev2d+1Eds1aWdZGvcWsITv294sI1OXj3n+iZKfeOuj5PqUw4
         v2TbOla8upKKxrWJdHsQD2iYVUvPF7QEMBjfBQrScAThI8fE8Ez7qAcyypOz1UVjlC4J
         bYghBjac27UYP7xp9/PNO9WSspDX40Q2SiqZXeXNI3lnElQDjRef+w7T0h7L1viZLnkZ
         Bdeg==
X-Gm-Message-State: AFuF++nLJo+DqiBMZbcqaLMwj4tCDq13Km9SGJAXi8tzLKo5UDiu4xmJ
	vD23KQWhgfqjl/cIbQrrZoalQ2EOGO+XJsUK5ryxkP8sMutdpOmcB9PFpxHEwxg4jX9/dzYGcbf
	b4LBAvA==
X-Gm-Gg: AYBFou1LJ659k8+Vj7EUY8MnjGImNggEL1ngaNQeVG6QCBRCydnhGRsazEW+VhZ4j7g
	Nxb4LsYD9ZOQZF4F+PShArXQ2InaWMgA6tCOYFWLK9xtjRbsaNYHUkb2mmCY4v5sejDkbKu6UxN
	uU1qGCCaBU2M9nqa6I7Pcz55sgPB4n4kNrZnoP3c2k4BCEpGZc8sbCI9sge55B38ojp0mvi0UQn
	p17WAYNyoMbL3RlW9taj0H+Yd7IeCAq0FivmYs5D2ARUqNFo4YmPBV9tAOyXyta2HSJpO8EAju1
	8Yp0/Qjda+5W3MHmGBnDEmvTI5nSBuplF7vlvxrSLe6VI9ZvEUMa+vlNdm72x6XOB6Wbq+ic1H7
	nHWIst9NnJRmPdvQ+QuI/LtAHJX39Snih4OvWh6a2zZBnMUa7H1/2KaBjqQlc7HcV1UO3Fdx7+H
	szC84QPra+iPAGtSmuXtwrab5kD3pyaZVwqWsFyoGhzPM69euoyRW6K6Xgv43nMBChtc/cFxVfi
	ioixUewnuX3FzqeCh+/zXp6UBfh9oba23DY1wAcaOYVoUAmdKs=
X-Received: by 2002:a05:600c:35ce:b0:49e:b733:7277 with SMTP id 5b1f17b1804b1-49fdd9655e8mr272935e9.2.1790091293445;
        Tue, 22 Sep 2026 08:34:53 -0700 (PDT)
Received: from google.com (250.192.189.35.bc.googleusercontent.com. [35.189.192.250])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fdaaec8ebsm55719525e9.2.2026.09.22.08.34.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 08:34:52 -0700 (PDT)
Date: Tue, 22 Sep 2026 15:34:48 +0000
From: Mostafa Saleh <smostafa@google.com>
To: sashiko-reviews@lists.linux.dev
Cc: kvmarm@lists.linux.dev, Oliver Upton <oupton@kernel.org>,
	Marc Zyngier <maz@kernel.org>
Subject: Re: [PATCH v8 14/25] iommu/arm-smmu-v3-kvm: Shadow the command queue
Message-ID: <arKgGEyRZutTLLB6@google.com>
References: <20260922131259.2975334-1-smostafa@google.com>
 <20260922131259.2975334-15-smostafa@google.com>
 <20260922133243.DE4181F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260922133243.DE4181F000FF@smtp.kernel.org>

On Tue, Sep 22, 2026 at 01:32:43PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [Medium] hyp: wrong WARN_ON() in smmu_emulate_cmdq_enable() causes panic
> - [Medium] hyp: WARN_ON() on host MMIO access creates dead-branch trap
> --
> 
> commit 6579ca2101bec241418169d448cfd8bd062f327e
> Author: Mostafa Saleh <smostafa@google.com>
> 
> iommu/arm-smmu-v3-kvm: Shadow the command queue
> 
> At boot, allocate a command queue per SMMU which is used as a shadow
> by the hypervisor. The host command queue is pinned in a shared state
> to prevent it from being donated to VMs.
> 
> > diff --git a/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c
> > index 7a51cb70205fe..b26c21b595b47 100644
> > --- a/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c
> > +++ b/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c
> [ ... ]
> > @@ -132,6 +222,23 @@ static int smmu_init(void)
> >  	return ret;
> >  }
> >  
> > +static void smmu_emulate_cmdq_enable(struct hyp_arm_smmu_v3_device *smmu)
> > +{
> > +	u32 shift = smmu->cmdq_host.q_base & Q_BASE_LOG2SIZE;
> > +
> > +	smmu->cmdq_host.llq.max_n_shift = min(shift, smmu->cmdq_max_shift);
> > +	smmu->cmdq_host.base_dma = smmu->cmdq_host.q_base & Q_BASE_ADDR_MASK;
> > +	smmu->cmdq_host.base_dma &= ~(cmdq_size(&smmu->cmdq_host) - 1);
> > +	WARN_ON(smmu_share_pages(smmu->cmdq_host.base_dma,
> > +				 cmdq_size(&smmu->cmdq_host)));
> 
> [Severity: Medium]
> If the host provides an invalid or unmapped command queue base address via
> the ARM_SMMU_CMDQ_BASE register, smmu_share_pages() will return an error.
> Since WARN_ON() expands to a fatal break instruction at EL2, would this
> allow the host to intentionally crash the hypervisor by passing bad input?
> 
> Could we handle the smmu_share_pages() failure gracefully instead of using
> WARN_ON() on host-controlled inputs?

No it couldn't, this only happen if the host is malicious or gone too
wrong.

> 
> > +}
> > +
> [ ... ]
> > @@ -158,6 +265,14 @@ static bool smmu_dabt_device(struct hyp_arm_smmu_v3_device *smmu,
> >  		break;
> >  	/* Passthrough the register access for bisectability, handled later */
> >  	case ARM_SMMU_CMDQ_BASE:
> > +		if (is_write) {
> > +			/* Not allowed by the architecture */
> > +			if (is_cmdq_enabled(smmu))
> > +				break;
> > +			smmu->cmdq_host.q_base = val;
> > +		}
> > +		mask = read_write;
> > +		break;
> 
> [Severity: Medium]
> When the host writes to ARM_SMMU_CMDQ_BASE while the command queue is
> enabled, the switch statement in smmu_dabt_device() breaks with mask
> remaining zero.

Yes, because that is not allowed by the architecture and no well
behaved host will attempt that.

> 
> Later in smmu_dabt_device(), there is an existing check:
> 
> > 	if (WARN_ON(!mask))
> > 		goto out_ret;
> 
> Because WARN_ON() at EL2 causes a fatal panic, the goto out_ret recovery
> path is dead code. Would this allow the host to crash the hypervisor by
> performing an invalid write to ARM_SMMU_CMDQ_BASE?
> 

Yes, the host can crash the hypervisor in many ways.

Thanks,
Mostafa




> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260922131259.2975334-1-smostafa@google.com?part=14
