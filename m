Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 547BD455612
	for <sashiko-reviews@lists.linux.dev>; Tue, 22 Sep 2026 15:48:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790092119; cv=none; b=eQbnVG27g6Mdh34yJL8C++xh6r9hO/iCmy58UlZnGxNlg1s+dF3UgS+Q3uh3wZtIEd68/BvNXSo2Yl3NFkggntq1/eh3SCkcCbjPiV/nRUVQVTkTDi+TYgpcM1V9a/a3xZ0sZ6BRgWXhskhIPnzV23t8Qx288yBfmGvyqBpSSzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790092119; c=relaxed/simple;
	bh=e6V5/fDpOITpm4y8ZPTZH8dhCHRlRK3ejZ2QZ36ke68=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QPv9GaABO/9m+dVNbm8BOEh5cFhb/vnNacJ/KfH2W22g8pHz4v5yNb/xmMpAU9RxE+he8/tc4IB+945FYOY0WBp51jN2DsblMWBwn/6oLGsZTkpf+9OWU70KaL9QBn2WN+NtFfvGCkqLatLPhNs6cNULVZSVLrYvHJi1wCKZQuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=QLWRkM8P; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="QLWRkM8P"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-498012a61f6so49525e9.0
        for <sashiko-reviews@lists.linux.dev>; Tue, 22 Sep 2026 08:48:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790092116; x=1790696916; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+yaLTio09ZqDyiSkRaRpkeexonWlNIuRI61Sy42yuZI=;
        b=QLWRkM8PVGwMzLjpcK+useQyLJ04GBBBfLJppREljN0ue0bvu1jT34h88DMhvWZaS1
         YHHRC9nH67xy4tgEq9b886Pm9SZv4KcyjtO1eBI/Cz/CGQ8IryyaZoIqLyprITRKgqPt
         mBPM0Qm3Vbcd717wfT3m1wTlNjFVurfrfvdA4i/Ww/Jeg0AXmF/qWiAWnFja7djZRU7D
         4EszPG3vr4ecdY51U3rSV9Xxqxn9J/BGGcEJyysZO8VkhkxnKjb51TjG55zWzZFC6WsN
         WjuVKlSm1kCXvlVmqop7YK4ExIB2KsJhsYKaXnIroA+O4/gDRgwj/WSV4PNWMEczEqRm
         /1/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790092116; x=1790696916;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=+yaLTio09ZqDyiSkRaRpkeexonWlNIuRI61Sy42yuZI=;
        b=ENk5PJ4NkKFUqaF7JQ/XweY2Z5tkRm3uOFQnKJWpyVTLVB8YCxLlWtofqXPC2bmptt
         3R0T5uy1Aqxj4uXiqxa1PKKtQhATxXV26BpG+5ZREdwc2wNjoBlkS2uvGbMA5xfhusaK
         2zJnnYYc+SzeNwFeWDW9kABFaFpM2WKf6fw/iTHMqEKvJh2upUYkr2GluKIEjbAeX8gw
         ZXVj2UKqKZMSu+qoRbpAQW/m3ycPDd0Q2ABkMpBT4GfheV57EDg7u67SdrNt5B4YYp+W
         oXZjrwTay0JLPymXvgnLwM9n0LOEOoUlWFFQ6zgrU+D0N6eJ8urG6Tn8gyCmL6V6qPZm
         PwYw==
X-Gm-Message-State: AFuF++k+ZvajNCgj7H6jC5U5V6zPA4PbPxB74Qti4eNtO9IL2gzHyg2w
	ec40OzAglkWXoUt/HhkO1ep5KfNsepLHFePwCsqpBi4AAh3PGrFjw+comSrXXLode4zpRPHnGs5
	yFNXpvQ==
X-Gm-Gg: AYBFou3BvIhXFktUwCSrD6ayrvSZA6SiJrh+N7rYyEuAvu72a6E80i+vYDplcPNy0KY
	CIsUsRfkCTP3muqTWQ0hiTNoxJq9/dFo/gJ+PLT9UtRlegRMytb7D8BejDnPKCfr4PBBHRVYZdU
	tU729YK0zoG4D0aRtG02vpbILN4+5FJ+uqFdFfaHS/veBjVbda4bIPe+f8whYlm7CT7lZusJv5C
	ZRKM/iHXi00Yd+DGd3hLvwBZZGXA6lDxEES80cie2qu/Z81zQB1aVcK0gw0KmhxlPzpKFne8dzX
	OGAtj20wdgCXq7rzeVw9QCs8VxDF22Cy58tlSGJ6WkHTrHwfaXsmXDxt+/88pdicb/oqrPkxMYq
	AQ709WqZUQt724OheW7z7QPUyCxd/OlWwid+44e6d3d8qMQEzGgq5uZX2bk/Upg7kZ4uc7O6gbV
	DpsJQPYI7Pf3oj+ONyCAMKIg5Dc2O0DGNcbwRTCg6WCecyynLVbyUxUJViY8O9U726q7w/ZOgm5
	vOJfo2/zO7Ix1Cte0h7OI28jfoDBW1alLb42TBp
X-Received: by 2002:a05:600c:6b06:b0:49f:ddf0:c413 with SMTP id 5b1f17b1804b1-49fddf0c51amr64255e9.3.1790092115118;
        Tue, 22 Sep 2026 08:48:35 -0700 (PDT)
Received: from google.com (250.192.189.35.bc.googleusercontent.com. [35.189.192.250])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4886277e611sm6427138f8f.18.2026.09.22.08.48.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 08:48:34 -0700 (PDT)
Date: Tue, 22 Sep 2026 15:48:30 +0000
From: Mostafa Saleh <smostafa@google.com>
To: sashiko-reviews@lists.linux.dev
Cc: Marc Zyngier <maz@kernel.org>, kvmarm@lists.linux.dev,
	Oliver Upton <oupton@kernel.org>
Subject: Re: [PATCH v8 16/25] iommu/arm-smmu-v3-kvm: Emulate CMDQ for host
Message-ID: <arKjTtj-UeEJwUjY@google.com>
References: <20260922131259.2975334-1-smostafa@google.com>
 <20260922131259.2975334-17-smostafa@google.com>
 <20260922133237.5A5381F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260922133237.5A5381F000FF@smtp.kernel.org>

On Tue, Sep 22, 2026 at 01:32:36PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 4 potential issue(s) to consider:
> - [High] arm-smmu-v3-kvm: Incomplete CMD_SYNC filtering allows arbitrary MSI DMA writes
> - [Medium] arm-smmu-v3-kvm: Data races on concurrent MMIO writes corrupt hypervisor state
> - [Medium] arm-smmu-v3-kvm: Misuse of WARN_ON() for untrusted host inputs panics hypervisor
> - [Low] arm-smmu-v3-kvm: Unnecessary wfe() sleep when waiting for CMDQ emptiness causes CPU stalls
> --
> 
> commit 59e5e956f9f689e4dbd688035f21063722fbd640
> Author: Mostafa Saleh <smostafa@google.com>
> Subject: iommu/arm-smmu-v3-kvm: Emulate CMDQ for host
> 
> This commit adds emulation for the host command queue in the ARM SMMUv3
> hypervisor. It prevents direct access to the command queue from the host,
> intercepting writes to CMDQ_PROD and CMDQ_CONS to sanitize commands and
> manage the queue lifecycle.
> 
> > diff --git a/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c
> > index 38b8ecc5cc10c..8c67e348f4a30 100644
> > --- a/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c
> > +++ b/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c
> [ ... ]
> > @@ -340,6 +339,105 @@ static int smmu_init(void)
> >  	return ret;
> >  }
> >  
> > +static bool smmu_filter_command(struct hyp_arm_smmu_v3_device *smmu, u64 *command)
> > +{
> > +	u64 type = FIELD_GET(CMDQ_0_OP, command[0]);
> > +
> > +	switch (type) {
> [ ... ]
> > +	case CMDQ_OP_CMD_SYNC:
> > +		if (FIELD_GET(CMDQ_SYNC_0_CS, command[0]) == CMDQ_SYNC_0_CS_IRQ) {
> > +			/* Do not allow MSI */
> > +			command[0] &= ~CMDQ_SYNC_0_CS;
> > +			command[0] |= FIELD_PREP(CMDQ_SYNC_0_CS, CMDQ_SYNC_0_CS_SEV);
> > +			command[1] &= ~CMDQ_SYNC_1_MSIADDR_MASK;
> > +		}
> > +		break;
> 
> [Severity: High]
> Does this regression leave the reserved CS value unfiltered? In
> smmu_filter_command(), if the host submits a CMD_SYNC command with the CS
> field set to 0b11 (Reserved), the filter only sanitizes MSIADDR if CS is
> exactly 0b01 (IRQ). Thus, a command with CS=0b11 could bypass the filter
> unmodified. If the hardware implementation aliases 0b11 to 0b01, this could
> allow the host to perform arbitrary DMA writes to hypervisor memory.

No, according to the spec:
    0b11: Reserved: Causes a CERROR_ILL.

> 
> > +	default:
> > +		/* Deny unknown commands */
> > +		return true;
> > +	}
> > +
> > +	return false;
> > +}
> > +
> > +static int smmu_emulate_cmdq_insert(struct hyp_arm_smmu_v3_device *smmu)
> > +{
> > +	u64 *host_cmdq = hyp_phys_to_virt(smmu->cmdq_host.base_dma);
> > +	bool use_wfe = smmu->features & ARM_SMMU_FEAT_SEV;
> > +	u64 cmd[CMDQ_ENT_DWORDS];
> > +	int idx, ret;
> > +	u32 pending;
> > +	bool skip;
> > +
> > +	if (!is_cmdq_enabled(smmu))
> > +		return 0;
> > +
> > +	pending = (1 << (smmu->cmdq_host.llq.max_n_shift)) - queue_space(&smmu->cmdq_host.llq);
> > +
> > +	hyp_spin_lock(&smmu->hw_lock);
> > +	/* Wait for the command queue to have some space. */
> > +	ret = smmu_wait(use_wfe, smmu_cmdq_has_space(&smmu->cmdq, pending));
> > +	if (ret) {
> > +		hyp_spin_unlock(&smmu->hw_lock);
> > +		return ret;
> > +	}
> > +
> > +	while (pending--) {
> > +		int i;
> > +
> > +		idx = Q_IDX(&smmu->cmdq_host.llq, smmu->cmdq_host.llq.cons);
> > +		queue_inc_cons(&smmu->cmdq_host.llq);
> > +
> > +		/* Copy the command to local buffer avoiding TOCTOU */
> > +		for (i = 0; i < CMDQ_ENT_DWORDS; ++i)
> > +			cmd[i] = le64_to_cpu(READ_ONCE(host_cmdq[idx * CMDQ_ENT_DWORDS + i]));
> > +
> > +		skip = smmu_filter_command(smmu, cmd);
> > +		if (WARN_ON(skip))
> > +			continue;
> 
> [Severity: Medium]
> Is this regression safe when using WARN_ON() for untrusted host inputs? At
> EL2, WARN_ON() expands to a fatal BRK instruction, causing a hypervisor
> panic. If the host writes a malformed command, this could allow a
> host-triggered denial of service. Should the code error out or ignore the
> command instead? I also noticed similar WARN_ON() assertions in
> smmu_dabt_device() when handling an invalid register access size.

Yes, no well behaved host will issue unsupported commands, so WARN_ON
should be OK here.

> 
> > +		smmu_add_cmd_raw(smmu, cmd);
> > +	}
> > +
> > +	writel(smmu->cmdq.llq.prod, smmu->cmdq.prod_reg);
> > +
> > +	ret = smmu_wait(use_wfe, smmu_cmdq_empty(&smmu->cmdq));
> 
> [Severity: Low]
> Could this regression cause the CPU to stall? The smmu_wait() loop uses wfe()
> to wait for the hardware queue to empty, but the hardware only generates an
> SEV on a CMD_SYNC command. If the host submits commands without a CMD_SYNC,
> the CPU could stall in wfe() until a random interrupt wakes it up or the 1ms
> timeout expires, leading to unnecessary latency.

True, I think we should pass WFE as an arg to this macro which is used for
certain conditions that are known to send an event. I will fix that.

> 
> > +	hyp_spin_unlock(&smmu->hw_lock);
> > +	return ret;
> > +}
> [ ... ]
> > @@ -381,18 +479,51 @@ static bool smmu_dabt_device(struct hyp_arm_smmu_v3_device *smmu,
> [ ... ]
> >  	case ARM_SMMU_CMDQ_PROD:
> > +		if (len != sizeof(u32))
> > +			break;
> > +		if (is_write) {
> > +			smmu->cmdq_host.llq.prod = val;
> > +			WARN_ON(smmu_emulate_cmdq_insert(smmu));
> 
> [Severity: Medium]
> Could this regression allow multiple threads concurrently mutating
> smmu->cmdq_host.llq.prod outside smmu->hw_lock to corrupt the queue state?
> Modifying this value without a lock could allow concurrent host writes to
> decouple the pending calculation from the consumer index.
> 
> Similarly, I see in smmu_dabt_device() that ARM_SMMU_CR0 is modified
> locklessly when calling smmu_emulate_cmdq_enable(). Could concurrent writes
> from multiple CPUs cause hypervisor panics due to double page
> sharing/unsharing or queue desynchronization?
> 

Wrong, smmu->cmdq_host.llq.prod is protected by the smmu->lock and the
not hw_lock which only protects the HW command queue.
And there is no part of the code where this is read or written without
the smmu->lock.

Also wrong for ARM_SMMU_CR0, the caller takes the lock.

> > +			goto out_ret;
> > +		} else {
> > +			val = smmu->cmdq_host.llq.prod;
> > +			goto out_update_regs;
> > +		}
> >  	case ARM_SMMU_CMDQ_CONS:
> > +		if (len != sizeof(u32))
> > +			break;
> > +		if (is_write) {
> > +			if (WARN_ON(is_cmdq_enabled(smmu)))
> > +				break;
> 
> [Severity: Medium]
> Could this regression allow the host to panic the hypervisor by attempting an
> invalid state transition (writing to CONS while the queue is enabled)? Like
> the other WARN_ON() usages for host inputs, this should likely be an error
> return instead of an assertion.
> 

Yes as mentioned before this is not allowed by the architecture, so
no well-behaved host will do that and WARN_ON should be OK.

Thanks,
Mostafa

> > +
> > +			smmu->cmdq_host.llq.cons = val;
> > +			goto out_ret;
> > +		} else {
> > +			/* Propagate errors back to the host.*/
> > +			u32 cons = readl_relaxed(smmu->base + ARM_SMMU_CMDQ_CONS);
> > +
> > +			val = smmu->cmdq_host.llq.cons | (CMDQ_CONS_ERR & cons);
> > +			goto out_update_regs;
> > +		}
> [ ... ]
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260922131259.2975334-1-smostafa@google.com?part=16
