Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DC8B47D952
	for <sashiko-reviews@lists.linux.dev>; Wed,  3 Jun 2026 12:36:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780490190; cv=none; b=VY6s0Fs81/wkyyeFQp1LX/hicurRC69cmLzhS7IJdhlasdZhDEYegM7PJUbSAKr6guuJo3EXqev/UGdr1ItTUIHh6ODwjf17p3/DZ8c5uFeBzJQn/vlETi4FR1hBTmx3jOhyB4+BfV5KIzcoxg0mJWsae5zf9bbU0vYFlqGLTlE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780490190; c=relaxed/simple;
	bh=+c7xdHNfMAXc//ynyxGHX/76K9qwADMyV/I+dP9BCkQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oSqd5WiBM5uTsSqstx6MJyzFvS1eJ/cz0tPBT4xk7YRmw7YDY5TsQl3LKi0+B0rYJwoNBi5CTCsy1d0uKK9bxSxmFyy36RtfJsMVljc1fVQM7dhQJ8v+Ip/1MEubFVSaMyoke85EkfI/XOynrNqO1JxLIy8+nRqhIKSSR4Tp+K0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=KNsKx3uG; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="KNsKx3uG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1780490186;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=FtQI7VZPghRzjzxiygAYqNu4ZVTPLlESHEEBUB5wXGU=;
	b=KNsKx3uGr9NKgW46SgzILNXPtBVWG9hzewW3wEBW3qbBebvzzatyXI6O3aAgmg1KcE6+k5
	W7vwDML+SsKDjawdM1CaykOueLiP2EnUa2H0bRS7C7MXxjTj098WHXlHcv5peTDWdkyrdK
	YgQXl6unvEgcm1pX7suxr85v+MElGLI=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-310-20Y-55-VMwOuha78WJAy0g-1; Wed,
 03 Jun 2026 08:36:22 -0400
X-MC-Unique: 20Y-55-VMwOuha78WJAy0g-1
X-Mimecast-MFC-AGG-ID: 20Y-55-VMwOuha78WJAy0g_1780490181
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 43A601956088;
	Wed,  3 Jun 2026 12:36:21 +0000 (UTC)
Received: from [10.44.33.95] (unknown [10.44.33.95])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 7FF2D195E483;
	Wed,  3 Jun 2026 12:36:20 +0000 (UTC)
Message-ID: <a2d7788a-3dc4-4acf-8b33-c786e55274f1@redhat.com>
Date: Wed, 3 Jun 2026 14:36:18 +0200
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 12/24] KVM: x86/mmu: move CPU-related fields to struct
 kvm_pagewalk
To: sashiko-reviews@lists.linux.dev
Cc: kvm@vger.kernel.org
References: <20260603105814.10236-13-pbonzini@redhat.com>
 <20260603112732.89DF71F00898@smtp.kernel.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Autocrypt: addr=pbonzini@redhat.com; keydata=
 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
In-Reply-To: <20260603112732.89DF71F00898@smtp.kernel.org>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-Mimecast-MFC-PROC-ID: mg7NXW2NnZFQ1hExzdIRGe9YC37ExmR2tl8dhqJLMjE_1780490181
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/3/26 13:27, sashiko-bot@kernel.org wrote:
> [Severity: Critical]
> This is a pre-existing issue, but while reviewing the PDPTR accesses here,
> I noticed a problem with how PDPTRs are handled on nested VM-Entry failures.
> 
> When using nested virtualization with shadow paging (EPT disabled), L1's
> PDPTRs are overwritten by L2's PDPTRs during a nested VM-Entry but are never
> restored on a failed VM-Entry.
> 
> Looking at nested_vmx_restore_host_state() in arch/x86/kvm/vmx/nested.c:
> 
> 	vcpu->arch.cr3 = vmcs_readl(GUEST_CR3);
> 	kvm_register_mark_available(vcpu, VCPU_REG_CR3);
> 
> 	/*
> 	 * Use ept_save_pdptrs(vcpu) to load the MMU's cached PDPTRs
> 	 * from vmcs01 (if necessary).  The PDPTRs are not loaded on
> 	 * VMFail, like everything else we just need to ensure our
> 	 * software model is up-to-date.
> 	 */
> 	if (enable_ept && is_pae_paging(vcpu))
> 		ept_save_pdptrs(vcpu);
> 
> L1's CR3 is restored here upon a VM-Entry failure, but the PDPTRs are only
> restored if EPT is enabled. If shadow paging is used (enable_ept is false),
> the L2 PDPTRs loaded during the aborted entry attempt remain in KVM's software
> model (vcpu->arch.pdptrs).

This is requesting to do the same as the non-architectural MSR unwind 
that is already in nested_vmx_restore_host_state().  It's true that it's 
pre-existing though.

Paolo

