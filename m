Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794489328;
	b=af2+qEScirRHdrsvKxhwBRO1wlFiK7G4Zg2OOowfBvVlB2eariUFM9jv4NFtqXybnDil
	 EhtGmk9MTfjjDlPNGdHSlVU4Q8i+qV2MZIIdVB87zrt3qYabqOh9wn1VP1rot1ynyuuhy
	 TgdgKaguDkn0QjeGi+VhXCHsk0WBpqfcHP3vQi7ZLRs8ijtXZ4LnhDvWEA7SNaEBn6Xdo
	 rmQ3ekDGwgcpJ3QAtTF5qXP5mPBywHz98WTUH6XQtWUQ1Kd86/zfjElAiKzweK+mj82nW
	 guL63GIBVZ0zDuxOqFKCA1LZGRJMyFAFn6RosRHC6CbMlJXBFkV+9/qJ/ORMEtC7s7A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794489328;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To;
	bh=e7CPF5orTIvftcTO8Leab/fUE5tFTHho+53fmzbA+Yw=;
	b=ZafevUQab1iddlWvTMbghZkMy4t+y84jRhWOMu+WLgdf/NYb8LYq/MU5PrFMqxNANlXi
	 kYOBhhHv7TnGO9KSuxAr54Ewga/1slgJbCnmocZ3Md39C90gvFIRKs5ZXp/94zQVrEnHd
	 S8cpXG7Tsq+l5KlaE3QDqmA+crEYGqfc3sf/rVQS6tFJuXK85Cer45Lod2/7nUgIs0Qq7
	 F+SNmbMdPPmzCniQ/74kAKWVUr1Eti8JvhWdz/YyWV8y7Nt/LXsU0UcUtuGayrJKIpwgw
	 a9WI04KAQRH/jCT1fNdjAHgVu9UlM+mWXoCTZke4jDayMvtBSMbaZcJUpZDfRWamknQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=lfr9DOuy;
	arc=none smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85AA4606A884
	for <sashiko-reviews@lists.linux.dev>; Thu, 12 Nov 2026 13:15:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 85AA4606A884
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=lfr9DOuy
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-4910b863b84so561347f8f.0
        for <sashiko-reviews@lists.linux.dev>; Thu, 12 Nov 2026 05:15:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794489326; x=1795094126; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=e7CPF5orTIvftcTO8Leab/fUE5tFTHho+53fmzbA+Yw=;
        b=lfr9DOuyZWmv5Ssus+lxnBlJ5IRb34UhjM0HGOXuqnDqXM10ISr796MkpvqwN7yP0X
         ZPbsV1LZIE5ax0IszTR3mcHYxOFgh90JiPmG0RHZIq58jg2Y/JBEwQAH9xtMfJCmF99T
         9lz7/FpftdpIQzdCKSaO7n2bKDfssIevck10lvds8oGK7CsLu3UvqKLbXZDv9QEH46xK
         qWasSzIsFuWdBCyMTL1OkMuJnfpq+jNA1eKVEroTPzD83iIdsyezqsm5UQU4AyQIeEgF
         4HU9KcX+OR6Zg8tZIUs9GNcFww+DuRVAMPw5MN1RNJcd/RJBxaVurwZyeQnIFqZzsefP
         yT3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794489326; x=1795094126;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=e7CPF5orTIvftcTO8Leab/fUE5tFTHho+53fmzbA+Yw=;
        b=RmcTAbL7Qsh63c04XSz65NVcjzCkj/vsxOX5H2+kXbQDOBiz9EAuqjq7PU/5tACQPG
         sg4isu7yIAN0lt2Ca2QEYpcLz5BHDsp7HovPP/bYUen8XcYUV50n2QhYRIza/4omOG8I
         r14QelZ8Bkj4gXV8W7Dk8x8reUbqtbmbKUUDPHDjGBVqmNoWJqq5Cbkka6dIAR2FGjCw
         ORcNJnyoBRv72kXyia4ubjrWORv1fcecg9ZGAvbdTtKbsozRqFpn3eG9SU/ht7yaK45q
         grcPgF2TFSRppEoH7Oik5PhtiJkTDFznBya8zHtUiR+0OrJd6x2Hx3AwBd8FaA+XsoKv
         ERFQ==
X-Gm-Message-State: APuU4Z9tqJkoEYv6ThU0ioH/ESn90EIbZ/qrpK0vyXRRtnIx0ZLlxWE2
	gxZI+kovWRwTOQHJOQhPyNxUUVky2tDD43qzvszM0w6aPk7VLgQlWzB4aGEWSoB/nlysmVXxQOt
	bYukR9g==
X-Gm-Gg: AYBFou0hdxrJ3xq1BjEbS968QQdQZYWJmRLWB9Bz2DSDEwsUq2NYX8rjOK3YCpfTj5s
	DeU6IasZDGCt1ClsblXekEwwPIUap1unh1xH3UC586f/+bnln3DF7c6Y08pexa7KTDAZfWtxSp8
	idslU9M7fqYAIkOxUX+3L+eGnYi/bnYjnnbUOawSqzsKegVEp00OWMn/IcyYM+VYPCqX+kqLqqI
	AAASdZfWkJu+LqacNskYNXO7pBMYRktgGa5kVBGQKxJ5TzNr7hSUxdSc5kFT+XX6UsCGwN4b9rO
	u3o0GBPtR7l+bPmBOZC1y7NagMRB9Vbk6p+fw8SicXlXK5dxh0Tlz0qgDbo2XLgU1CwwW5BeMII
	79b0K2xmNcsleOy2TnHAwVVrIdQxd426HQMsmG4rZbJFx5HnKhh/sc0Wu+57+ZFnwnJ18EpAs/A
	PvyFbG0XWsOcRskQiap+hh4LrSvw6k2+9Yf8jcW4MQctevNUmiawdZ4qTupisdeM7aY6qJQ/1A/
	FY8eMv0BKoxGs5XoYYRXJVkVfopHciOpkfWJrbIxj/93TVWAmzVpkoeDFcPuH/COwsCBW01E1tn
	4lYzuPchn1TbpoYsSwyXYpxQZCnYqqomL/2c72QIwqFnTS0QjnN3C5JOUMDMTzJXXw==
X-Received: by 2002:a05:6000:4684:b0:491:9332:935a with SMTP id ffacd0b85a97d-49afdf7ee91mr3623954f8f.1.1794489325121;
        Thu, 12 Nov 2026 05:15:25 -0800 (PST)
Received: from google.com (0.182.34.34.bc.googleusercontent.com. [34.34.182.0])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49835d2bf91sm17033305f8f.23.2026.11.12.05.15.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 05:15:24 -0800 (PST)
Date: Thu, 12 Nov 2026 13:15:20 +0000
From: Vincent Donnefort <vdonnefort@google.com>
To: sashiko-reviews@lists.linux.dev
Cc: kvmarm@lists.linux.dev, Oliver Upton <oupton@kernel.org>,
	Marc Zyngier <maz@kernel.org>
Subject: Re: [PATCH v3 18/23] KVM: arm64: Introduce
 kvm_pgtable_stage2_table_install()
Message-ID: <avW76NcAokHunPXw@google.com>
References: <20261102204628.401871-1-vdonnefort@google.com>
 <20261102204628.401871-19-vdonnefort@google.com>
 <sashiko-outbox-194174@kernel.org>
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
In-Reply-To: <sashiko-outbox-194174@kernel.org>

On Mon, Nov 02, 2026 at 09:02:11PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [Medium] KVM: arm64: missing block alignment check in stage2_table_install_walker()
> - [Low] KVM: arm64: kernel-doc mismatch for kvm_pgtable_stage2_table_install()
> --
> 
> commit 2ec53eff489eca020eb2705b64a21720b1def67f
> Author: Vincent Donnefort <vdonnefort@google.com>
> 
> KVM: arm64: Introduce kvm_pgtable_stage2_table_install()
> 
> This commit introduces kvm_pgtable_stage2_table_install() to replace a
> stage-2 leaf entry with a pre-allocated table, enabling pKVM to handle block
> splitting in mem_protect.c without relying on kvm_mmu_memory_cache.
> 
> > diff --git a/arch/arm64/include/asm/kvm_pgtable.h b/arch/arm64/include/asm/kvm_pgtable.h
> > index 1c9c57cd6ae40..587874c3a5259 100644
> > --- a/arch/arm64/include/asm/kvm_pgtable.h
> > +++ b/arch/arm64/include/asm/kvm_pgtable.h
> > @@ -835,6 +835,18 @@ int kvm_pgtable_stage2_flush(struct kvm_pgtable *pgt, u64 addr, u64 size);
> >  int kvm_pgtable_stage2_split(struct kvm_pgtable *pgt, u64 addr, u64 size,
> >  			     struct kvm_mmu_memory_cache *mc);
> >  
> > +/**
> > + * kvm_pgtable_stage2_table_install() - Replace a stage-2 leaf entry with a table.
> > + * @pgt:	Page-table structure initialised by kvm_pgtable_stage2_create_unlinked().
> > + * @addr:	Address identifying the leaf entry to replace.
> > + * @size:	Size of the block to replace.
> > + * @tab:	Pointer to the pre-allocated table to install.
> > + *
> > + * Return: 0 on success, negative error code on failure.
> > + */
> > +int kvm_pgtable_stage2_table_install(struct kvm_pgtable *pgt, u64 addr, u64 size,
> > +				     kvm_pte_t *table);
> 
> [Severity: Low]
> In the kernel-doc comment for kvm_pgtable_stage2_table_install(), @tab does
> not match the parameter name table in the prototype (and definition in
> arch/arm64/kvm/hyp/pgtable.c), which triggers a scripts/kernel-doc warning.
> 
> Also, @pgt is described as initialised by
> kvm_pgtable_stage2_create_unlinked(). Should @pgt be documented as
> initialised by kvm_pgtable_stage2_init*(), with @table being the table that
> may be created by kvm_pgtable_stage2_create_unlinked()?

That one is easy!

> 
> > diff --git a/arch/arm64/kvm/hyp/pgtable.c b/arch/arm64/kvm/hyp/pgtable.c
> > index abd32e94f6ff0..19634e5ec5557 100644
> > --- a/arch/arm64/kvm/hyp/pgtable.c
> > +++ b/arch/arm64/kvm/hyp/pgtable.c
> 
> [ ... ]
> 
> > @@ -1620,6 +1634,55 @@ int kvm_pgtable_stage2_split(struct kvm_pgtable *pgt, u64 addr, u64 size,
> >  	return ret;
> >  }
> >  
> > +struct stage2_table_install_data {
> > +	struct kvm_s2_mmu	*mmu;
> > +	kvm_pte_t		*table;
> > +};
> > +
> > +static int stage2_table_install_walker(const struct kvm_pgtable_visit_ctx *ctx,
> > +				       enum kvm_pgtable_walk_flags visit)
> > +{
> > +	struct stage2_table_install_data *data = ctx->arg;
> > +	struct kvm_s2_mmu *mmu = data->mmu;
> > +	kvm_pte_t *childp = data->table;
> > +
> > +	if (ctx->level == KVM_PGTABLE_LAST_LEVEL)
> > +		return -EINVAL;
> > +
> > +	if (ctx->addr != ctx->start ||
> > +	    ctx->end != ctx->addr + kvm_granule_size(ctx->level))
> > +		return -EINVAL;
> 
> [Severity: Medium]
> Does this check verify that ctx->addr is aligned to the block granule size
> kvm_granule_size(ctx->level)?
> 
> In kvm_pgtable_walk(), both walk_data.start and walk_data.addr are
> initialised to ALIGN_DOWN(addr, PAGE_SIZE):
> 
> 	struct kvm_pgtable_walk_data walk_data = {
> 		.start	= ALIGN_DOWN(addr, PAGE_SIZE),
> 		.addr	= ALIGN_DOWN(addr, PAGE_SIZE),
> 		.end	= PAGE_ALIGN(walk_data.addr + size),
> 		.walker	= walker,
> 	};
> 
> In __kvm_pgtable_visit(), data->addr is only aligned down to
> kvm_granule_size(level) and advanced after the leaf callback returns 0:
> 
> 	if (!table) {
> 		data->addr = ALIGN_DOWN(data->addr, kvm_granule_size(level));
> 		data->addr += kvm_granule_size(level);
> 		goto out;
> 	}
> 
> Because stage2_table_install_walker() is only invoked for
> KVM_PGTABLE_WALK_LEAF and always returns a non-zero value, ctx->addr is
> always equal to ctx->start on the first visited leaf entry, making
> ctx->addr != ctx->start always false.

Right, this can be dropped.

> 
> If kvm_pgtable_stage2_table_install() is called with an addr that is
> page-aligned but not aligned to kvm_granule_size(ctx->level) and with size
> equal to kvm_granule_size(ctx->level), this check will pass, replacing the
> enclosing block PTE and passing an unaligned IPA to stage2_try_break_pte().
> Although the callers added later in the series (__pkvm_host_split_guest()
> and host_stage2_split_gfn_meta()) check PMD_SIZE alignment beforehand,
> should stage2_table_install_walker() check
> !IS_ALIGNED(ctx->addr, kvm_granule_size(ctx->level))?
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20261102204628.401871-1-vdonnefort@google.com?part=18

Perhaps a better API would be

  int kvm_pgtable_stage2_table_install(struct kvm_pgtable *pgt, kvm_pte_t *table, u64 addr, s8 level)

This would match kvm_pgtable_stage2_create_unlinked() which is also using
"level". Then, we can easily reject a non-aligned addr and drop the checks in
the walker.

-- 
Vincent
