Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF26154DAD1
	for <sashiko-reviews@lists.linux.dev>; Tue, 22 Sep 2026 15:50:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790092245; cv=none; b=KwwsAhWnjYL+V6tiRX6PmtCItkiPdlOLIEkXQaHQlXNaHpl2x74IQHFAKaPq8tpma6xbnh3LoOjB3VSOKSRMttkqOr98NJ5UdsofWB8xbvMqEKSTKc1AZ54miBuy/HuLNeV/osDEJmsHXFnthhWeN4A+GtZVAnglvWZL4tbOa5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790092245; c=relaxed/simple;
	bh=439gmKqGSkI0bSgfo/c8tSzeErhRdn6H6zh2Wpv0viM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LA8BqIc/dXCpFNN68rkKazbsGRTR1RCloooCrGjspsNjgg+cXpE9J0kt8e6y3Y3xPeIcpe3byzGexj++liV1e1KxQJzGHhO+5xnOEHM+bYwPGg+HQR6507JYK6WuATYHMZp8IGJ+sjEsKV6ei+o6+kJT+fJnQxO2VvMGIT7mLjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=axglfwqh; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="axglfwqh"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-49e6425f96eso56845e9.1
        for <sashiko-reviews@lists.linux.dev>; Tue, 22 Sep 2026 08:50:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790092242; x=1790697042; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=pQklSd2If0fiviP4ibB0laMw7g6bcjewAcYXAq+ENYg=;
        b=axglfwqhIsiB0ziSpNONRgGwm7jvc4idaL2YenZ9uUTaKZrbrZ+XxyQRahlbeI9hRD
         ZtDuZlMCUtTJQxMN0Hix3jOJdXSQsZ5mIQV0jEvCy41+PproZC0qrSvwxKMqiv1lbIZf
         EXIyZuZsvu0SlCSdXlL1k22gOEPzD8T80HMzy6kKDwOhPgT9VBmaHutHgQAW1JW2tIVY
         NG4s78cKRis7DXV7r3fAYetGV6obE8u0rurZ1ZKtXmgWqHe6xNt57/mo7QoHY/kWJJsP
         nP5kmFNjoo6xBUbYQ/Ax+xq8u80vkwxo91wbjlJQfGBiS5UiJRqOBDuyetICz1dVCK+w
         4CNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790092242; x=1790697042;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=pQklSd2If0fiviP4ibB0laMw7g6bcjewAcYXAq+ENYg=;
        b=10UgV4zjAp0kPHQYDUfw/8URl+uakQoSw1lt7sGjsOy3crHbNo4spwsSw6B7sanGyg
         KCbqv8CANW3dW5wG1e27gbPvGjmPxyuoV3u/by2U5L04TuLVNXBUwGk36Qhhqwpt5AJ9
         tRXrjKQFXDE2kXFbsdHp271ZmNy2msTjewkDzMjq27dK4d/crr2nWO79fmdcOlFPwGDM
         WIJcgkTZyztpZF8Gxj6hrzo6s5HlMkFAr5cOy2f2M6oaw1fbDTks3z16vrtcajlwfL5L
         lhG+o/tWi8qVGW1dtwNe/sc5TuYOInTANPy/8C7hyHr0apii6N2brrltFyqcnH/kqxTX
         DBeA==
X-Gm-Message-State: AFuF++mb+Jt2TniNffw2JOm0/D1J4PWSEBalUFTZ82UDuHrZmZzympB1
	ne71AgktjNUpPxpU0ifx8A8+9Q3F3l3i/zKAyQurF4IMQ2tutDdVzP7xrA6l4CFoPyyvH/JHmMM
	+RT4QTg==
X-Gm-Gg: AYBFou3yIDwHix79h8jwBMMeTdhMUytQGp+A4fXRiQOJO+FCQtRYVt58kBvrKu4DPcd
	Tyr7OmM1Ht8rDslpgk6zwJLayflL7HCWVo3QCTeQ0/+mm5nzf4dd5I1jZyIdtRkvr/QBNWFZUkc
	w0xq2Z7liBjyAHxYJelBgwI01CO9RaPV1SfsznNZez+J06O5GM8udoFGSeE9apuYUoIHXEJhIv8
	xxLHyoKCdC7RrofhInhMjTFubbvDm5VqQAvw2D8EtaftLNNhoWA1N0VMxTAwC9QyGQ/alnSOIZ/
	DIhYYKITGBRjO43O1wCl0/o2RDzbdy3UjrvJxKcdZyjBAjxqfCIv3yKlmqctf9HT85sezREaVBq
	q4z2t1901JxpawRHrUFSvoIVNsh0VgDlXDpnyybAavb9YN8CTEHvtBFPMwOjukBm5D8wabwZRte
	hXeyRt/1vyHc0CsMBNpg+FtLnMYTKz9AhiapjkxhcFm9slii4jmww3UZIgTR7iw6qK9xtspDh6x
	5iVpYZS3IzDc+KejvI7sgmfa+/vbQbJp/KzaVxRQV80BhvWAkM=
X-Received: by 2002:a05:600c:1c06:b0:49f:ddcf:45b7 with SMTP id 5b1f17b1804b1-49fddcf467fmr169095e9.10.1790092241625;
        Tue, 22 Sep 2026 08:50:41 -0700 (PDT)
Received: from google.com (250.192.189.35.bc.googleusercontent.com. [35.189.192.250])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4886277def8sm6355003f8f.14.2026.09.22.08.50.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 08:50:40 -0700 (PDT)
Date: Tue, 22 Sep 2026 15:50:37 +0000
From: Mostafa Saleh <smostafa@google.com>
To: sashiko-reviews@lists.linux.dev
Cc: kvmarm@lists.linux.dev, Oliver Upton <oupton@kernel.org>,
	Marc Zyngier <maz@kernel.org>
Subject: Re: [PATCH v8 17/25] iommu/arm-smmu-v3-kvm: Shadow stream table
Message-ID: <arKjzVDb56JmHJMc@google.com>
References: <20260922131259.2975334-1-smostafa@google.com>
 <20260922131259.2975334-18-smostafa@google.com>
 <20260922133309.CD1F51F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260922133309.CD1F51F000FF@smtp.kernel.org>

On Tue, Sep 22, 2026 at 01:33:09PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [Medium] arm-smmu-v3-kvm: unhandled break in switch statement causes EL2 panic on STRTAB access
> - [Medium] arm-smmu-v3-kvm: improper WARN_ON() usage for host inputs allows trivial EL2 panics
> --
> 
> commit a05ba1b1951c6df5b35f980e9826eb9d8a4ea188
> Author: Mostafa Saleh <smostafa@google.com>
> 
> iommu/arm-smmu-v3-kvm: Shadow stream table
> 
> This patch allocates the shadow stream table per SMMU with a maximum size
> of 1MB for 2-level tables. It sets up passthrough for host writes to the
> stream table base and configuration registers, laying groundwork for future
> CFGI command trapping.
> 
> > diff --git a/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c
> > --- a/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c
> > +++ b/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c
> [ ... ]
> > @@ -438,6 +499,46 @@ static int smmu_emulate_cmdq_insert(struct hyp_arm_smmu_v3_device *smmu)
> >  	return ret;
> >  }
> >  
> > +static int smmu_update_ste_shadow(struct hyp_arm_smmu_v3_device *smmu, bool enabled)
> [ ... ]
> > +static void smmu_emulate_enable(struct hyp_arm_smmu_v3_device *smmu)
> > +{
> > +	/* Enabling SMMU without CMDQ, means TLB invalidation won't work. */
> > +	if (WARN_ON(!is_cmdq_enabled(smmu)))
> > +		return;
> 
> [Severity: Medium]
> Could this WARN_ON panic EL2 if the host enables the SMMU without enabling
> the CMDQ? Since WARN_ON at EL2 behaves as a fatal panic, using it for
> host-controlled inputs converts an invalid host state into a hypervisor DoS.
> Would returning an error be safer here?
> 

Yes, as I replied before.

> > +
> > +	WARN_ON(smmu_update_ste_shadow(smmu, true));
> > +}
> 
> [Severity: Medium]
> Similarly, does this panic EL2 if the host provides an invalid stream table
> configuration? The pKVM guidelines suggest that EL2 should not assert on
> contracted host inputs.
> 
> [ ... ]
> > @@ -525,7 +626,23 @@ static bool smmu_dabt_device(struct hyp_arm_smmu_v3_device *smmu,
> >  		}
> >  	/* Passthrough the register access for bisectability, handled later */
> >  	case ARM_SMMU_STRTAB_BASE:
> > +		if (is_write) {
> > +			/* Must only be written when SMMU_CR0.SMMUEN == 0.*/
> > +			if (is_smmu_enabled(smmu))
> > +				break;
> 
> [Severity: Medium]
> Does this break statement erroneously exit the entire switch block for
> ARM_SMMU_STRTAB_BASE? If the host writes to this register while the SMMU is
> enabled, the break bypasses the mask assignment, leaving mask = 0. Later in
> the function, if (WARN_ON(!mask)) evaluates to true, which triggers a fatal
> hypervisor panic.

Not an error, that is the intent, a panic will happen if the host
violate the spec.

> 
> > +			smmu->host_ste_base = val;
> > +		}
> > +		mask = read_write;
> > +		break;
> >  	case ARM_SMMU_STRTAB_BASE_CFG:
> > +		if (is_write) {
> > +			/* Must only be written when SMMU_CR0.SMMUEN == 0.*/
> > +			if (is_smmu_enabled(smmu))
> > +				break;
> 
> [Severity: Medium]
> Could this break statement similarly cause an EL2 panic on STRTAB_BASE_CFG
> access? Like the case above, this appears to leave mask = 0 and panic the
> hypervisor.

Same as above.

> 
> > +			smmu->host_ste_cfg = val;
> > +		}
> > +		mask = read_write;
> > +		break;
> >  	case ARM_SMMU_GBPA:
> [ ... ]
> 
> [Severity: Medium]
> Are there other instances where WARN_ON is used to validate host inputs?
> For example, in smmu_emulate_cmdq_insert():
> 
> smmu_emulate_cmdq_insert()
>     skip = smmu_filter_command(smmu, cmd);
>     if (WARN_ON(skip))
>         continue;
> 
> And at the end of smmu_dabt_device():
> 
> smmu_dabt_device()
>     if (WARN_ON(!mask))
>         goto out_ret;
> 
> Since these are directly reachable by the host kernel, they allow a trivial
> host self-DoS by inserting an unsupported command or performing an unhandled
> access length. Could these assertions be replaced with standard error
> handling or abort injection?
> 

Same as above.

Thanks,
Mostafa

> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260922131259.2975334-1-smostafa@google.com?part=17
