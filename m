Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=85.214.250.239
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793622126;
	b=WJ3+QQlbhySEoY9lWPU33J5vq78J2GSStMWoqciOZAHkURnuDfqMCZEvQBJ81fiTuXJy
	 H0269uqacUzzQvUvO6FoB3UQqKOOct2De7CIeGC9RU03H8jgZLi9ehiyeB1/rkOdrB47X
	 bLysPnvCKI+kR/i5gCWCiOMWLVVlONVfQbQRpLMHNazNc0h/DOMabOEGJJhprZjbyk9k2
	 W6X+evTDcRzNe98/nGL5Nm0mZFM65nkFXGbdWqGeVG3bdZFEwG8s0Hz9v40fKVvHDVV7p
	 skm5TT5hQWI++0AriEqJjJ0kzD5KYWxXp/my8wesOC88jhhW9xxLw8gsNRDzEmlvmjA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793622126;
	h=DMARC-Filter:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=5praovLmNMiloGLMSjvfeB53TP3rGZZiLQVrVPcBvW8=;
	b=DABLcOholsKKH5B5KwCfJL2QiyrcOFJksB71zQtkT8PTwNejpkpc4waeUU/H8B2Rd9U6
	 9SvJU7i8k1QwS/iRB/2E1Czus59d0dj4g/yWQCJ4WLxqO2vSQbMYwQTVYA13daQjOGpeg
	 drM9EGMHl7UIM4iX46X5KGcbjdM6aeBG8oClgh+LGFaeYj+wsd3cLn9aGETwxyF/UHi2X
	 dE4V0CBKSx1akmAphEBuqTIcQxVEn7gsKGz64ZkS8XSBLlx8Sv6/gLHE5kxRtQnU/K7FZ
	 D2EJks1aOhoIny+wkpwZd2gkTiUA7LBLZjAX7jRXm40gB+IPHdqyx137ajiS+uyKxig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=8bytes.org;
	spf=pass smtp.mailfrom=8bytes.org;
	arc=none smtp.remote-ip=85.214.250.239
Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1B74606AA20
	for <sashiko-reviews@lists.linux.dev>; Mon,  2 Nov 2026 12:22:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E1B74606AA20
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8bytes.org
Received: from 8bytes.org (p200300f6af404a0027ad06761c59e6b3.dip0.t-ipconnect.de [IPv6:2003:f6:af40:4a00:27ad:676:1c59:e6b3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 7623F243716;
	Mon,  2 Nov 2026 13:22:04 +0100 (CET)
Date: Mon, 2 Nov 2026 13:22:02 +0100
From: =?utf-8?B?SsO2cmcgUsO2ZGVs?= <joro@8bytes.org>
To: sashiko-reviews@lists.linux.dev
Cc: kvm@vger.kernel.org
Subject: Re: [PATCH v3 2/8] KVM: SVM: Implement GET_AP_APIC_IDS NAE event
Message-ID: <auh_-EkrjCjUaiA9@8bytes.org>
References: <20261102114137.1198982-1-joro@8bytes.org>
 <20261102114137.1198982-3-joro@8bytes.org>
 <sashiko-outbox-193355@kernel.org>
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <sashiko-outbox-193355@kernel.org>

On Mon, Nov 02, 2026 at 11:52:44AM +0000, sashiko-bot@kernel.org wrote:
> [Severity: High]
> As reported by Sashiko on v2 [1], GHCB_HV_FT_APIC_ID_LIST is added
> unconditionally to GHCB_HV_FT_SUPPORTED and sev_handle_vmgexit() dispatches
> SVM_VMGEXIT_GET_APIC_IDS to sev_snp_get_apic_ids() for all SEV-SNP guests
> without host userspace opting in.
> 
> When an SEV-SNP guest queries hypervisor features via GHCB_MSR_HV_FT_REQ in
> sev_handle_vmgexit_msr_protocol() or SVM_VMGEXIT_HV_FEATURES in
> sev_handle_vmgexit(), it will unconditionally observe GHCB_HV_FT_APIC_ID_LIST.
> If a guest uses this feature and is migrated or restored onto a kernel without
> SVM_VMGEXIT_GET_APIC_IDS support, guest execution will fail when invoking the
> NAE event.
> 
> Should this new guest-visible feature default to off and be gated behind a
> capability via KVM_CHECK_EXTENSION and KVM_ENABLE_CAP so userspace can manage
> feature exposure and live migration compatibility?

No, this feature is for SEV-SNP guests only, which can not be live migrated.
Live migration for SEV-SNP guests will be built on-top of this feature (among
others).
