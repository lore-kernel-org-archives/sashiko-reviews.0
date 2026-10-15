Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D316C4DDB5D
	for <sashiko-reviews@lists.linux.dev>; Thu, 15 Oct 2026 21:23:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792099443; cv=none; b=IJNjSS/bQ4iSNmfh3CXKo9iTm0co6coThdDX4OeoxqHsmHkdBG4WNqZBSMGMv85yNYkTL446VbqEh6ykSMlgGeadIQ4UiX2myAwOd3U5J1XAWo9Pzj77fVIaqZrBKYgpohAD+SNW1YLhqSp/ouqc7Um9GM8/FqVkglOFU4q6D5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792099443; c=relaxed/simple;
	bh=S8fYKrfNvJJv66Z4s8STvMnElaZy7qPGtoS/PedPDTg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=izPRS2jV93zYOuOm+1R0ueLAi115XBwcmcXYOxXkFJjWetMLVgtJUwtnVnl3lLXBNTXTAiGdRNQk0X4OqSUplElBlQvHsOx/2eEGENVTs0ibsx5STbwq6tDmqxh8r2962aUrmyRRGNIkccLiXylxz5OzHGVCZJRa2YLO3AO7J6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=NLOCV02y; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="NLOCV02y"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a18617ae90so22905e9.0
        for <sashiko-reviews@lists.linux.dev>; Thu, 15 Oct 2026 14:23:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792099434; x=1792704234; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=uFAkmU2KNoHsXl07ym0ghH6ndIdP/5rBqBbNPJbL8TM=;
        b=NLOCV02yBwVfuzDbnh9p9p0EVw3msUTwxVxRzNeNUErw8Edxk2lYebb8X1wp2s2D1Z
         0q5oWEbgPfwoAIxy/NkYy7azodm+yME4Yy8c4IHE0QYUYiT+8exXNKn5JiFFfrEvntWe
         WXjuLEpS6SadQXwG6oHTz+Y2tEwpm/9OyD2+4/0pcYwvn6CeXseWNAKe1SJV2qPNXMOI
         garitaxrx3a60S8E61d4k5vcMe0kJjo243iZthTH4noTHtpr9GOOo0SKkVQ0qgl/inAb
         FmuUWoj5LEGIRINWGUxRXfcSpHxkLKpKriJmkeCmItne3cZRbDwEJKfWdboqocaETRTm
         HBiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792099434; x=1792704234;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=uFAkmU2KNoHsXl07ym0ghH6ndIdP/5rBqBbNPJbL8TM=;
        b=IpjCxlV2OdKDypO75Z9AzNcoFsfudlpRCuvz3Cw5c8ADoZfxC+LKrpPO+svtr5R/y3
         qPsnh/mVEuPWsub6LF4AtNMWIKsfFTJTzoDmYicsM4AZja/3kX4kgZr9/HDIoqCFpdSd
         5r0EyhTngjF1eQnxo09lOsF+3ToJWrWnd5mlu5n/9se4dxTUrSOscLiJYlXYY2NDlO9k
         krPhiysSE4xoqW0W5YAq9c+QrlDUIfgEx5D4dJy3DLIDfyOXi+h7nGQMXj23Pb5ob/7G
         lAKj2thTHrKGBMbcdpAQs+C/qiA3M5i5fG7NedoH/cxxrveqdMlL4b5Hjqyx61vOAlqr
         55KA==
X-Gm-Message-State: AFq9FYLOygyWKxyDsLscQ5pEMTXIp9d5ncbGDVpcXWXqGVSs0WrxvOOk
	iXrMPr6hBCIrviU0iIxBsgi0jH5VL2NVnLrcCPoBWKhxorEkTnKH+Abg8ZCxLgX/xWjdCGrTwTw
	iruydbA==
X-Gm-Gg: AYBFou2303EJpVN1q3k8Py7dxhPTGFBfr38FZloVOJdTkhZrlnq7ByUy8E//scYxdfJ
	4GhuUIIKqUdDg88DDk/2ZBK0o/+kTh6bqvvPGCvyjPRLgExxPHBqwdmxjQM5oh6Vo5/vzKCcNSg
	AxXGhQ9m5ECaoUoRX4lywp+s+BYeWQqi3HZjMQJcViAf4MFz4kBAhiQIhTLV1k5vjCzjbehcloL
	IEjfqMeT1C+COd6X6yt4iuKb8wjSWLTOTuHcrzJT/D7Zxv9Z9ik0PXshRoN0npYhDucF9CxLYNH
	+S13mNcIlNeuWsl7QYO6c+17AFhDABfI1EA09N0PWQMslS2+Cq1FcaZepp9k6IenHysU9AwyCqR
	tUoa7w9dY02ytbdnizrNuxjK6YXOiTK0lkO6SO0g8lN1ZlpKRQbLdvcIig818URY75GRNDpymo+
	yBnfq0Tn8YTMRacODSuEFCxeBECYKleSxDOgREyEovz0X/Q3hYtvGryjY8BYV7arkYJNH/mRJYJ
	I5cmWbrmEWpdqryYuo3UgqyKPqLAfPO5Mr9ksVXO3OR6XiDbFM=
X-Received: by 2002:a05:600c:6b09:b0:4a1:80d4:55ce with SMTP id 5b1f17b1804b1-4a1c851de60mr249445e9.4.1792099433592;
        Thu, 15 Oct 2026 14:23:53 -0700 (PDT)
Received: from google.com (160.193.189.35.bc.googleusercontent.com. [35.189.193.160])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1c8af2fcesm7139825e9.8.2026.10.15.14.23.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 14:23:53 -0700 (PDT)
Date: Thu, 15 Oct 2026 21:23:49 +0000
From: Mostafa Saleh <smostafa@google.com>
To: sashiko-reviews@lists.linux.dev
Cc: kvmarm@lists.linux.dev, Oliver Upton <oupton@kernel.org>,
	Marc Zyngier <maz@kernel.org>
Subject: Re: [PATCH v9 19/25] iommu/arm-smmu-v3-kvm: Share other queues
Message-ID: <atFEZVR0zT00l1y_@google.com>
References: <20261015200903.2735565-1-smostafa@google.com>
 <20261015200903.2735565-20-smostafa@google.com>
 <sashiko-outbox-173392@kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <sashiko-outbox-173392@kernel.org>

On Thu, Oct 15, 2026 at 08:29:08PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] iommu/arm-smmu-v3-kvm: EL2 panic on kexec due to locked EVTQ/PRIQ base addresses
> --
> 
> commit bfd6e271a581b5d4148ccc397cc5a82480d46470
> Author: Mostafa Saleh <smostafa@google.com>
> 
>     iommu/arm-smmu-v3-kvm: Share other queues
> 
> This commit introduces pinning and sharing of the event and PRI queues in the
> hypervisor to prevent the host from writing to protected memory. It enforces
> that the host cannot change the base addresses of these queues once they are
> shared.
> 
> > diff --git a/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3-hyp.c b/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3-hyp.c
> > index 132f3a9ba3084..1972df1d2a8dc 100644
> > --- a/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3-hyp.c
> > +++ b/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3-hyp.c
> [ ... ]
> > @@ -806,6 +852,34 @@ static bool smmu_dabt_device(struct hyp_arm_smmu_v3_device *smmu,
> >  
> >  		mask = read_write;
> >  		break;
> > +	case ARM_SMMU_EVTQ_BASE:
> > +		if (len != sizeof(u64))
> > +			break;
> > +
> > +		if (is_write) {
> > +			/* See ARM_SMMU_CR0 */
> > +			if (is_evtq_enabled(smmu) ||
> > +			    (smmu->evtq_shared && smmu->evtq_base != val))
> > +				break;
> 
> [Severity: High]
> Does this rigid check prevent the host from performing a successful kexec?
> 
> When the host executes a kexec, the new kernel boots and initializes its own
> SMMUv3 driver, allocating new memory for the EVTQ and writing the new base
> address here. Since EL2 state persists across kexec and the hypervisor never
> clears smmu->evtq_shared upon disable, this condition evaluates to true.
> 
> The break leaves mask = 0, which then triggers the WARN_ON(!mask) at the end
> of the handler, resulting in a fatal hypervisor panic.
> 

kexec is not supported in pKVM.

> > +			smmu->evtq_base = val;
> > +		}
> > +		mask = read_write;
> > +		break;
> > +
> > +	case ARM_SMMU_PRIQ_BASE:
> > +		if (len != sizeof(u64))
> > +			break;
> > +
> > +		if (is_write) {
> > +			/* See ARM_SMMU_CR0 */
> > +			if (is_priq_enabled(smmu) ||
> > +			    (smmu->priq_shared && smmu->priq_base != val))
> > +				break;
> 
> [Severity: High]
> Similarly, does this check for the PRIQ base address cause the hypervisor to
> panic during kexec?
> 
> Just like EVTQ, the new kernel initialized during kexec will write a new
> PRIQ base address, triggering this break and hitting the same fatal
> WARN_ON(!mask) further down.
> 

Same as above.

Thanks,
Mostafa

> > +			smmu->priq_base = val;
> > +		}
> > +		mask = read_write;
> > +		break;
> > +
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20261015200903.2735565-1-smostafa@google.com?part=19
