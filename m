Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 207FE3F9294
	for <sashiko-reviews@lists.linux.dev>; Thu, 15 Oct 2026 21:37:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792100231; cv=none; b=lgsOR+0S+MAxqnO2ZhGb6z7HLgjVmk8I8apHXU9T2ZKWKgWhp//yzLvsGa8IC5VGkyMmgy2Ra/r+g9SE0UX5W50/MvAFRRPMtYru6WxGjAnxkJW8/LDYpaVFSPOvGM3zBkXgh1QmLoE+/gYgQcF76QmkJZy+c9/bvH5NgRQ5xM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792100231; c=relaxed/simple;
	bh=386oVWfTK7j80sjNixNYLJd6ruHZ1xN4lGXGD+O8SHQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qUDP8y+BvssvEkXfmr2bLzknyUYtTp9cVJoDtSppjczZ4uTOSuLemHn7aYDMUxGD9FYzTJnG+PJajd90SU8S9woUCXRal0xHxu2olWJsb0F1go023pRHQH808SUdfAFX3snYSp6mLS+d12ddzepGIc/i/1LTUMYV2c0Ix6W18nY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=apD5h0qT; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="apD5h0qT"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a18617ae90so23625e9.0
        for <sashiko-reviews@lists.linux.dev>; Thu, 15 Oct 2026 14:37:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792100226; x=1792705026; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3oR7WBo625HYQwcxrhw35THi++ot7WU5ktgUJV6FYhQ=;
        b=apD5h0qT8EQmyVi+gEZQABtEvEXTk9IqyrNB9fBvMq37IBU5/wEWRzrMfhB0AGn2o6
         V1ULmLrDFTikGD2dM5MiltdVPR+ylBzeGTfANGUvNmeWG6peBex6jbl8UCuE3OejGtG/
         M4AG/CQkD6N9qVj63M5lcBIIavv1aEKn2zTqKwHqVamCsCKSNSeoERC35axB5Jvru1uQ
         ppM2vg6rIjeoEFXjbYU8nUASsxquWeaR0CQtxSj/Xtt9VxZ5tACO5bu7oc3/Iuev459J
         8gSxFlL7vXBHtZ9iHXVfdgFt0dsJ+3hS+hq2KK/LGNg8NEujxmeffPfZG9pzsIrI4AeE
         5KCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792100226; x=1792705026;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=3oR7WBo625HYQwcxrhw35THi++ot7WU5ktgUJV6FYhQ=;
        b=Eos3N3PPY1NF37HROhal1vTOydsbgn7ptoUXeNJmVPw50XcJ8dryPmmNp77JTK1IZy
         jRPw7FgyAI4BmBhLVHJrk+pHtd1HsqVDcfgobvdmaaG8r3kQwMY378EhddpNfV/Xgvfn
         nb/xdNFMzqkaSkVPGH8G6Bpe/wovjO+jQGnhO5wpkwspKZwaRqcaMyyYzSr7gEr3hjLK
         9PJF9jN9Zy67jOaqvlxdmdbyLvjw1P7F1C/BypqaRZhZ69cR+ms+nNfgJYUP7YpoG6Sv
         AQAd/8tCujI/DaqvdOHqPyNYyARtNJQNgaL0Z2zS1IY6I0uTu04RwNo6jvupm2W9PtVS
         EBVg==
X-Gm-Message-State: AFq9FYKktk/zHkr8FJfQSbZ0Gu81FTHqthtBjs8p8vQx91UzAO+ZYui3
	o1YF2LhTwAeKoFk8VdzpvhzSiXJbMojmkKZ7BlQqD70Gt/ZRjzFebYVHgeukVUsRTX2kKuv7ehZ
	nw3MljQ==
X-Gm-Gg: AYBFou3LSvbW7oTT3vUjNEzQbBsx5gERQna0habQnhMo9sASfbvJXmD6TIKj6rU6hbN
	wDtsENTcy8y0C6a4ITdUbiuGJh3nUWgFXp9UbdWSsfEKRPq5wqouA3OVymy8YQlwE5FDYrdw3S1
	vJoAbyhOq1s8Owh5fvQU0GTiSu7JX5eCnKWw+rSBq2LJKhxmxcdz4b5g/QBvyMyJm2HpbEJn5OE
	7zMwk7Vj6V14gkXOy+svkrXzMyVKvSaAcsia6eR/GudIDeNK6nXM5hoF22mbQaJJB9j1hite/Sc
	wefKIJiw/lW6vqKV4mlOIZB9HTdT7Xgz0JjPoutyE3qKSiHqtsLCgNLXHiIVhGjh+wKu986S6MA
	bXHSHAyrjSa6M8zqrD//qgu3/h4RiqgQI6Qw/SW4v8/21J/5FCqMNzq+yPvLkMK/7DW6nCgPpmP
	cUrXi51oWHgx2eE5mjbuN4MbOQ6WwRGTgAyMukEGFNr8MUIbSOFFCACGOTNDxpuKMCaapgb7wlQ
	VYaLVOYwVAmTLOcfy6QlvJ6K6NdFYVd+EvNIbkx
X-Received: by 2002:a05:600c:34cd:b0:4a1:9034:e9ac with SMTP id 5b1f17b1804b1-4a1c8adefe4mr144145e9.14.1792100225727;
        Thu, 15 Oct 2026 14:37:05 -0700 (PDT)
Received: from google.com (250.192.189.35.bc.googleusercontent.com. [35.189.192.250])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1bd9b8b5fsm106779685e9.9.2026.10.15.14.37.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 14:37:05 -0700 (PDT)
Date: Thu, 15 Oct 2026 21:37:01 +0000
From: Mostafa Saleh <smostafa@google.com>
To: sashiko-reviews@lists.linux.dev
Cc: kvmarm@lists.linux.dev, Oliver Upton <oupton@kernel.org>,
	Marc Zyngier <maz@kernel.org>
Subject: Re: [PATCH v9 24/25] iommu/arm-smmu-v3-kvm: Enable nesting
Message-ID: <atFHfW4_1ZN1EYlk@google.com>
References: <20261015200903.2735565-1-smostafa@google.com>
 <20261015200903.2735565-25-smostafa@google.com>
 <sashiko-outbox-173401@kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <sashiko-outbox-173401@kernel.org>

On Thu, Oct 15, 2026 at 08:34:42PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [Critical] iommu/arm-smmu-v3: fatal EL2 panic on host-supplied invalid STE or ENOMEM
> - [Medium] arm-smmu-v3-kvm: Incorrect EL2 WARN_ON usage for hardware timeout
> --
> 
> commit 5625f7b65b03ea88554c9ce7668b1dabbbb068b1
> Author: Mostafa Saleh <smostafa@google.com>
> 
> iommu/arm-smmu-v3-kvm: Enable nesting
> 
> This commit enables stage-2 translation for the ARM SMMUv3 under pKVM
> by allowing the hypervisor to sanitize and control the stage-2 portion
> of the Stream Table Entry (STE).
> 
> > diff --git a/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3-hyp.c b/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3-hyp.c
> > index 01f23fce6be50..3562bb222f53e 100644
> > --- a/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3-hyp.c
> > +++ b/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3-hyp.c
> [ ... ]
> > @@ -443,6 +443,60 @@ static int smmu_init_cmdq(struct hyp_arm_smmu_v3_device *smmu)
> > +static int smmu_attach_stage_2(struct hyp_arm_smmu_v3_device *smmu,
> > +			       struct arm_smmu_ste *ste)
> > +{
> [ ... ]
> > +	/* S2 is not advertised, that should never be attempted. */
> > +	if ((cfg == STRTAB_STE_0_CFG_S2_TRANS) ||
> > +	    (cfg == STRTAB_STE_0_CFG_NESTED))
> > +		return -EINVAL;
> 
> [Severity: Critical]
> Can this error return lead to a hypervisor panic?
> 
> When smmu_attach_stage_2() returns -EINVAL, the error propagates to
> smmu_filter_command(), which evaluates it and returns true to indicate
> the command should be skipped.
> 
> The preexisting caller smmu_emulate_cmdq_insert() then processes this
> skip condition using WARN_ON:
> 
> smmu_emulate_cmdq_insert() {
>     ...
>     skip = smmu_filter_command(smmu, cmd);
>     if (WARN_ON(skip))
>         continue;
> }
> 
> At EL2 under pKVM, WARN_ON expands to a fatal breakpoint. Since the host
> can supply an invalid STE configuration that triggers this -EINVAL, could
> this allow the host to maliciously crash the hypervisor?
> 
> Similarly, allocating the L2 table in smmu_reshadow_ste() can fail and
> return -ENOMEM, which also propagates into this same fatal WARN_ON path
> during an out-of-memory event.

Yes, that is by design as replied previously.

> 
> [ ... ]
> > +static void smmu_ste_writer_sync_entry(struct arm_smmu_entry_writer *writer)
> > +{
> > +	struct smmu_ste_writer *ste_writer =
> > +		container_of(writer, struct smmu_ste_writer, writer);
> > +	struct arm_smmu_cmd cfgi_cmd = arm_smmu_make_cmd_cfgi_ste(ste_writer->sid, true);
> > +
> > +	WARN_ON(smmu_send_cmd(ste_writer->smmu, &cfgi_cmd));
> > +}
> 
> [Severity: Medium]
> Is it safe to use WARN_ON for hardware interactions that might time out?
> 
> If the SMMU command queue is full and smmu_send_cmd() times out waiting
> for it to drain, it will return -ETIMEDOUT. Because WARN_ON is fatal at
> EL2 under pKVM, this transforms a transient hardware latency or a heavy
> command load into a hypervisor panic.

As discussed in the last patch.

Thanks,
Mostafa

> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20261015200903.2735565-1-smostafa@google.com?part=24
