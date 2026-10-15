Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA7E047ECF1
	for <sashiko-reviews@lists.linux.dev>; Thu, 15 Oct 2026 21:18:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792099097; cv=none; b=mRO/zvTgCQywvvEf7n2KZWDcgjTATDwpyouoHRU0kxUUy0VpBMV5BGBaJcxJHJEOkKzwuj5yMBQ3gLSEdoxJ2DcaPoM/1kmlW05zpIJRp9nkRYKiPiHmFvXbMF9CLO2sc26vlUqFXzfRHAynfysydeG9NcuCD52++a3nv0E4AXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792099097; c=relaxed/simple;
	bh=LMBAf2/vas6JaCOvZ0cUaeg3YXiUsxQIPPIqfBm9DPE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OdAyRa9H/nb+WYRWJtV+vcuc3YQzUc8mTJoxAns81dNyjqcaHB4tTHPpgMKX90K4ryfMInylaO5Zrp5ASlDiAeCB/aVKEO/pmNRViSZAvFpziPeDKosMDOgk5fJzGRfocriBv1B5z8MItJRozTTqCQJ2N2IIhClJSFMXV4yUnOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ttoBaxjw; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ttoBaxjw"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a021c28046so5175e9.1
        for <sashiko-reviews@lists.linux.dev>; Thu, 15 Oct 2026 14:18:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792099083; x=1792703883; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=mGhCiCxy/Vk9JPlIBjpq29kn1QBSCOPFUhyy8hBKHRE=;
        b=ttoBaxjwrM69UUiw+9bea4vD8i4RzVraTqzaWPUstEQaRHnoqHZ9jopG0g7Sb7jWfX
         TagT1oklAfOuVXyc+DgPvEu78FtWaxBx0yWlRPpBystrQgsn2P7OK07y/kl8fZH1e/j5
         bKEeJkrKDzCEZZj0Uo3CRQYyR5R6XTc3e1D2Sp2OsmpEBBKHMVMYZKD9JTusEtgTb1uy
         6BAFr93GiJlnL4lJ0pG6/VEAmq9H4lKDVs9vQPJeBt5g8siGXk3Fqs28Gyc8N6UO5O+r
         oTcgzAsf2Av1YzGadK6H8AcvajesyOvwmViCKto/7DpDIblRI4ymYmCk4YAPDYczx9gp
         d3Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792099083; x=1792703883;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=mGhCiCxy/Vk9JPlIBjpq29kn1QBSCOPFUhyy8hBKHRE=;
        b=Os0uK2Ersh6TuqJcA8yst6i3PDCnMXkPxw4MWBemndT9tgaaPX53bQWA2wLIFYd0qF
         txHF51JiRbgzRIY2Qns1iGm96PDiRa4yKRoM/Irp58mxQMQdbbeDQRBKQixEkQ56zAXJ
         bx7QbZsLLyEQQHMT9n/Gy8TTrqcdUDfQsJld4Xs3NqznE0soE+pVZRsW45OKnxgcmyo3
         3SnRNO1QNj54NY9j85iGTfJoQcUCZ1+zuovbe3SPlbDZ+UkW3ijito/j+w3JwbLqgx2R
         Bv8/HsQXQr04ygyDxTUJxz0pL7Sbhtci4zJy6G8srNLOD7B4HBsRSK37Uw4LAIE1e1eT
         AWWQ==
X-Gm-Message-State: AFq9FYIIh8BH0i2MZlO/EKlFotAaK1A00mrPKeh0GsWufVgNxImYW+6b
	x1xIGbqgss8qTR+uiSMJXuNwzI2UXr90xW+BqD3Q96iiL+TNkeiPlCPvpnZfolkQmL4EKAYkBEE
	MLB4uFg==
X-Gm-Gg: AYBFou0Ccz8AP//tbk16S9RVYCpR5IwrRQ6MtCKlWSTcqU4G/WQs/t65ggfEuxuP6vi
	BNqc3n1cJtdB9juf6epTzq5um9KxYWH4bDWFMPavQSKU4kV2hEyBXkP263X2Z7lARIPls2fp+g7
	QEy38C77CaGrekhqM02ydQ2WMZGIf/8GNB0t5V+xf6OyKqwIGrENdWuh4jzdCx9Ba0gCKIix5Bz
	S8QhA7VVy0NfggU688cFP4TIwa0p4nakUPbMwXZ1BGnUwPD4ztAw9IL2dLewV3DNT6Hu6SiBFgT
	RaT3rL8+c8pKSvDX8it3EWzs/luEFt8qXbchzunhNPTOvFLSOpu7GqmMM9cA2rfMvNvyl/F3Sjc
	Qaf/FKDy6EiLBe84wxkO7Cnp8IjaJM39yaOKAlL89pvoYB9giiEQTbbC+kCWEj8WlLfpcp06XC2
	4SAdvk8FoUsOCnNyLZ+wklHkGa3MKxOkx1lc92PBfZ2xFoDF4uRv+EYbgoc0pMLL07oJ/s08yDj
	R0hSsXTHRW9gvO+wsg0dxmTAs6dYMpAfXKdiFhm
X-Received: by 2002:a05:600c:a5a8:b0:49c:ff18:79bd with SMTP id 5b1f17b1804b1-4a1c8abfb3amr95775e9.9.1792099082124;
        Thu, 15 Oct 2026 14:18:02 -0700 (PDT)
Received: from google.com (250.192.189.35.bc.googleusercontent.com. [35.189.192.250])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1bd9b8ebdsm113632015e9.10.2026.10.15.14.18.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 14:18:01 -0700 (PDT)
Date: Thu, 15 Oct 2026 21:17:58 +0000
From: Mostafa Saleh <smostafa@google.com>
To: sashiko-reviews@lists.linux.dev
Cc: kvmarm@lists.linux.dev, Oliver Upton <oupton@kernel.org>,
	Marc Zyngier <maz@kernel.org>
Subject: Re: [PATCH v9 16/25] iommu/arm-smmu-v3-kvm: Emulate CMDQ for host
Message-ID: <atFDBjY66Ucu0pd5@google.com>
References: <20261015200903.2735565-1-smostafa@google.com>
 <20261015200903.2735565-17-smostafa@google.com>
 <sashiko-outbox-173396@kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <sashiko-outbox-173396@kernel.org>

On Thu, Oct 15, 2026 at 08:30:32PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 4 potential issue(s) to consider:
> - [Critical] iommu/arm-smmu-v3-kvm: user-triggerable hyp panic via unhandled SMMU commands (e.g., CMDQ_OP_ATC_INV)
> - [Critical] iommu/arm-smmu-v3-kvm: CMD_SYNC filter allows arbitrary memory writes via SIG32
> - [High] iommu: EL2 panic on SMMU hardware timeout or CERROR due to WARN_ON
> - [Medium] arm-smmu-v3-kvm: Dead-branch traps due to WARN_ON() panicking at EL2
> --
> 
> commit 44f2b5e9d53208cadd7d659b59bf05189d20f72d
> Author: Mostafa Saleh <smostafa@google.com>
> 
> iommu/arm-smmu-v3-kvm: Emulate CMDQ for host
> 
> This commit introduces command queue emulation for the host in the ARM SMMUv3
> pKVM driver. It filters command queue entries, shadows the queue, and prevents
> the host from directly manipulating the hardware command queue to ensure isolation.
> 
> > diff --git a/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3-hyp.c b/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3-hyp.c
> > index c9fc21e405e79..dc9b1e659a422 100644
> > --- a/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3-hyp.c
> > +++ b/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3-hyp.c
> [ ... ]
> > +static bool smmu_filter_command(struct hyp_arm_smmu_v3_device *smmu, u64 *command)
> > +{
> > +	u64 type = FIELD_GET(CMDQ_0_OP, command[0]);
> > +
> > +	switch (type) {
> [ ... ]
> > +	case CMDQ_OP_TLBI_NH_ASID:
> > +	case CMDQ_OP_TLBI_NH_VA:
> > +	case CMDQ_OP_TLBI_NH_ALL:
> > +	case 0x13: /* CMD_TLBI_NH_VAA: Not used by Linux */
> > +	{
> > +		/* Only allow VMID = 0 */
> > +		if (FIELD_GET(CMDQ_TLBI_0_VMID, command[0]) != 0)
> > +			return true;
> 
> [Severity: Critical]
> Could this reject valid nested-translation TLBI commands? A host userspace
> process with IOMMUFD nested translation might legitimately trigger invalidation
> commands (like CMDQ_OP_TLBI_NH_VA) where the host injects a non-zero VMID.
> 
> Because this returns true, the command gets rejected, which later leads to a
> hypervisor panic (see below) triggered directly from userspace.
> 

Wrong, the host kernel only sees a single stage SMMUv3, so it can't issue
non zero VMID or IPA invalidations.

> > +		break;
> > +	}
> > +	case CMDQ_OP_PREFETCH_CFG:
> > +	case CMDQ_OP_CFGI_CD:
> > +	case CMDQ_OP_CFGI_CD_ALL:
> > +	case CMDQ_OP_TLBI_NSNH_ALL:
> > +	case CMDQ_OP_PRI_RESP:
> > +	case CMDQ_OP_RESUME:
> > +		break;
> > +	case CMDQ_OP_CMD_SYNC:
> > +		if (FIELD_GET(CMDQ_SYNC_0_CS, command[0]) == CMDQ_SYNC_0_CS_IRQ) {
> > +			/* Do not allow MSI */
> > +			command[0] &= ~CMDQ_SYNC_0_CS;
> > +			command[0] |= FIELD_PREP(CMDQ_SYNC_0_CS, CMDQ_SYNC_0_CS_SEV);
> > +			command[1] &= ~CMDQ_SYNC_1_MSIADDR_MASK;
> > +		}
> 
> [Severity: Critical]
> Does this allow the host to inject an SMMU hardware instruction that executes
> an arbitrary physical memory write? The filter specifically neutralizes CS=1
> (IRQ), but it appears to ignore CS=3 (SIG32). If a malicious host issues a
> CMD_SYNC with CS=3, the hardware might perform a 32-bit physical memory write
> of the host-provided MSIData to the host-provided MSIAddress, compromising the
> hypervisor or guest memory.

As mentioned in v8:
https://lore.kernel.org/all/20260922133237.5A5381F000FF@smtp.kernel.org/

This is not true, there is no such encoding in the spec.

> 
> > +		break;
> > +	default:
> > +		/* Deny unknown commands */
> > +		return true;
> 
> [Severity: Critical]
> Could valid user-triggerable commands hit this default case? For example,
> CMDQ_OP_ATC_INV appears to be missing from the allowlist. Since it returns
> true, this will also result in a user-triggerable hypervisor panic when the
> caller evaluates the rejection.
> 

ATS is hidden from IDR0, the kernel shouldn't attempt to use it.

> > +	}
> > +
> > +	return false;
> > +}
> > +
> > +static int smmu_emulate_cmdq_insert(struct hyp_arm_smmu_v3_device *smmu)
> > +{
> [ ... ]
> > +		skip = smmu_filter_command(smmu, cmd);
> > +		if (WARN_ON(skip))
> > +			continue;
> 
> [Severity: Medium]
> Will this execute the continue statement? At EL2 in nVHE/pKVM, WARN_ON() expands
> to a BRK instruction and triggers a fatal hypervisor panic. Because the macro
> doesn't return, the error-handling path is dead code, and rejecting a command
> results in a hard panic.
> 
> This also elevates the severity of the filter rejections mentioned above. If
> userspace can trigger a rejected command (like CMDQ_OP_ATC_INV or a nested
> TLBI with VMID != 0), it becomes a Denial of Service attack against the host
> system.
> 

Again, by design, any unsupported command will panic, that can be
relaxed, but that only happens if the kernel is malicous or buggy so
I'd prefer to catch the place caused the issue to make that easier to
debug.

> > +		smmu_add_cmd_raw(smmu, cmd);
> > +	}
> > +
> > +	writel(smmu->cmdq.llq.prod, smmu->cmdq.prod_reg);
> > +
> > +	ret = smmu_wait(false, smmu_cmdq_empty(&smmu->cmdq));
> > +	hyp_spin_unlock(&smmu->hw_lock);
> > +	return ret;
> > +}
> [ ... ]
> > +static bool smmu_dabt_device(struct hyp_arm_smmu_v3_device *smmu,
> > +			     struct user_pt_regs *regs,
> > +			     u64 esr, u32 off)
> > +{
> [ ... ]
> > +	case ARM_SMMU_CMDQ_PROD:
> > +		if (len != sizeof(u32))
> > +			break;
> > +		if (is_write) {
> > +			smmu->cmdq_host.llq.prod = val;
> > +			WARN_ON(smmu_emulate_cmdq_insert(smmu));
> 
> [Severity: High]
> Can a hardware timeout or CERROR cause a hypervisor panic here?
> smmu_emulate_cmdq_insert() relies on smmu_wait() to check if the hardware
> command queue is empty. If the SMMU hardware halts due to an error or takes
> too long under heavy load, smmu_wait() returns -ETIMEDOUT.
> 
> Because the return value is wrapped in WARN_ON(), this timeout will be
> converted into a fatal EL2 panic instead of propagating the error.
> 

Yes, if the HW hangs, we can't return as the TLB state might leak
donated memory, so in that case we have to panic.

> > +			goto out_ret;
> > +		} else {
> > +			val = smmu->cmdq_host.llq.prod;
> > +			goto out_update_regs;
> > +		}
> > +	case ARM_SMMU_CMDQ_CONS:
> > +		if (len != sizeof(u32))
> > +			break;
> > +		if (is_write) {
> > +			if (WARN_ON(is_cmdq_enabled(smmu)))
> > +				break;
> 
> [Severity: Medium]
> Similar to the dead-branch trap above, the break statement here appears to be
> unreachable code. Because WARN_ON() expands to a fatal BUG() at EL2, writing
> to the CMDQ_CONS register when the queue is enabled will panic the hypervisor
> instead of just ignoring the write.

Yes, that just looks cleaner, similar patterns used in mem_protect.c,
compilers are smart now and will remove it.

Thanks,
Mostafa

> 
> > +
> > +			smmu->cmdq_host.llq.cons = val;
> > +			goto out_ret;
> > +		} else {
> [ ... ]
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20261015200903.2735565-1-smostafa@google.com?part=16
