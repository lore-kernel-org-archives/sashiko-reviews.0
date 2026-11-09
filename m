Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794214421;
	b=V12/9LfmXi2BypO/4+8fO0Km/e2uKJ5nBWcb9I0+kQPMbc++ESv89ZTvaBzj33j9h2/d
	 EqzqZ0HxXemiccWZgYeQCDe7k1DJ9PUoVbf7y4jeCCSswTupfInGw3khgdvEG+HN5p6ZU
	 HIdTkOcERuLK4PoyOL66lbFcWWqD2QIaUnm8BJte6HsIw96CiGSKdfU5y+9rR4h/T579M
	 0gW6QOLo2DIgLPnARh4BY5Ff2G9wrzan3MYv//aYwXCbzO0vUDgeXtByBo044p34AJz4Q
	 XiJpNx1UX4HIJ7qPX9bSI8sg9WFQj7jaEY9aB9eW1cGObd8Yf8SDFI3j4gXZPp1SFcw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794214421;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Received:X-Gm-Message-State:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:
	 X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=wK3Kj9ggnG7kxPcgujmWtBo3WnCYjA2Q28UFcLisF6c=;
	b=JWbaqx7v8dEnat6U4M4VdXwRQti+o1sQ1GlemrVqDs6WkuuynmZf98tjW99ln9A6AOAX
	 w+ecIcRztwJGPd3/Z23JczK3g2svNAm03G4FOhYxBxNgDFkDOG3h8wdQNezROvQ8fRvFz
	 Gx3TL2oHrwHNyBk11Mz50vhQExXBlswp/4DTYQt5IqaJ05mSSOidYrZf4SX3sJMbKiMm6
	 XbpnMy+oMHegUOUAZVfAKxrCMclA+Z4o43NK/Qp2k4B1yJyA9PFaaLPn4Uflu08AA4HoF
	 p+TkQW28wwZivOT9iGNyFSbIEsVetn/3TUK/LhxCL0gZTynt6NlUjQD22H78jDuIPiA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=GmQltGGf;
	arc=none smtp.remote-ip=91.218.175.171
Received: from mta0.migadu.com (out-171.mta0.migadu.com [91.218.175.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08E44606D80F
	for <sashiko-reviews@lists.linux.dev>; Mon,  9 Nov 2026 08:53:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 08E44606D80F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=GmQltGGf
X-Envelope-To: sashiko-reviews@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=z1iR6/blDGadFjt4UJ120lWqA44OWbGZlUOQA5is+Kw=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794214417; v=1; x=1794819217;
 b=GmQltGGfrTRBUljc6pE0pz7Mu0htxj0pppojL9LWHniQGiK9XjB4pRmucf+Uv9ZWQirxRZJX
 vRdwZaGM1f21wuPAZGw9YdDSisUb39cCtS5fq0JA+BI7H6XERvwC6Cl68CeYkpPUwweukifKr1Q
 gbQYE9fZgvaTYALmI1j6nyC8=
X-Envelope-To: sashiko-reviews@lists.linux.dev
Received: by smtp.migadu.com with ESMTPS id 368778e633d6f8a2;
	Mon, 09 Nov 2026 08:53:37 +0000
X-Mizu-Trace-ID: 368778e633d6f8a2
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5be58ad9600so2606e87.0
        for <sashiko-reviews@lists.linux.dev>; Mon, 09 Nov 2026 00:53:32 -0800 (PST)
X-Gm-Message-State: APuU4Z+13bRg7D46odkg65lA4WYdUW0LcbJgSBguAWZha2qkSMIEsYGD
	WS1so8QuLLpS1AKa4a+VXq/o/ZFwENx7QYzm2VSJIv9A7gHxBE+AckeyAc6+AC492OpUQ5I7Oy7
	MtU02d49OP004x5vf4ClZrogwXVri9s2L6lxInXJj
X-Received: by 2002:a05:6512:1192:b0:5bf:f0fb:2c9c with SMTP id
 2adb3069b0e04-5c00b5c77a9mr135877e87.5.1794214259400; Mon, 09 Nov 2026
 00:50:59 -0800 (PST)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261109083205.806619-1-fuad.tabba@linux.dev> <20261109083205.806619-5-fuad.tabba@linux.dev>
 <sashiko-outbox-204612@kernel.org>
In-Reply-To: <sashiko-outbox-204612@kernel.org>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Mon, 9 Nov 2026 08:50:22 +0000
X-Gmail-Original-Message-ID: <CA+EHjTwgOuCha6e7PREa8WkJMChtgiRfFZjTBadV-ZjzqA=miA@mail.gmail.com>
X-Gm-Features: AclHuK--kTlM3MBNHvnwf6yTPpfzyPkz-vODHm7UL62nptqv6qWIB2G90_uWc1M
Message-ID: <CA+EHjTwgOuCha6e7PREa8WkJMChtgiRfFZjTBadV-ZjzqA=miA@mail.gmail.com>
Subject: Re: [PATCH 04/16] KVM: arm64: Advertise ID_AA64ZFR0_EL1 to protected VMs
To: sashiko-reviews@lists.linux.dev
Cc: kvmarm@lists.linux.dev, kvm@vger.kernel.org, 
	Oliver Upton <oupton@kernel.org>, Marc Zyngier <maz@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, 9 Nov 2026 at 08:48, <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found no new issues
> in this patch, but noticed 1 related pre-existing issue it does not
> introduce:
> - [High] KVM: arm64: GPA and GPI exposed without vm_has_ptrauth() in
>   pvmid_aa64isar1 [1]

Fixed here:

https://lore.kernel.org/all/20261109084854.840576-2-fuad.tabba@linux.dev/

/fuad
