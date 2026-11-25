Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.203
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795622361;
	b=F3+r1wX1YhGvHU8NaC7z7ZSOknKCvChuid1YJxBqh+gtXmflZEKhnCSWMa8KYh1o3qt7
	 Fqqzgus2dL+0HI5BApWgpevYhzFCl9MYDOovpIWaGfWslDHzHItGDBZU12Vf5noFANkh2
	 ihJlEZJ6dN3OV0FdJGQAhNv3+PeiQh9BAkjRbPjgfBAX39kq4+sHfYUV/jNBer185gmNa
	 nRv4ANTZX9KA8a39TW6r2HLG/T1dwVrSR4CzfprWlyzIh5Z6GTR2DLstnUZk5XWc/6Fcc
	 MIP3YabssfulVhSZintMtPqVY51EuN+OaRgHFmv7De+dL/cyD0pANAsOemES5jMjEXg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795622361;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Received:X-Gm-Message-State:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:
	 X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=cvTi/nNYHR2TYIOUf2vi5rClYm97tIxKBSXMmmYFqlY=;
	b=pRQX2HZMgoHfTm+s1gB6X2lG253E+kyj6M4mqGNl7Afu42ViSdNaX0qWa4TTCeFeObSF
	 IvdYjj1vDIKqosJNlz96+mWToES5aKixXCodm4qJIFJO/JfknOOOHlxlpMlAxGyDeiUOX
	 G2wwPP/wQmDnkFXPQFEeCsgnEBqZmnJzs/N3HDO7VdBirp2XVIM7SMzBR4Swg/jxUrB5K
	 gz12DfFlAr8aY+FCzEGU4PKOfpPc9+dOQiQ9EFyKJ+B7wLCcHN6sjwscXq0WOTLLySWEK
	 IOrXIXmXR0ptS8g129ks8v40OWclCw95c+DqhdX8xir2pOfPocw/qX3qd+VjKuA2X4A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b="Z3Ubng/b";
	arc=none smtp.remote-ip=95.215.58.203
Received: from mta1.migadu.com (out-203.mta1.migadu.com [95.215.58.203])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 420CE606A321
	for <sashiko-reviews@lists.linux.dev>; Wed, 25 Nov 2026 15:59:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 420CE606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=Z3Ubng/b
X-Envelope-To: sashiko-reviews@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=/XkNz3r9eFnmSbOvrGYUn0rZ+WAp3AeHIjYmS1q0RGE=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795622359; v=1; x=1796227159;
 b=Z3Ubng/b3bzRAvV5aDdv/E3OWysTvCe7sg+njVUlTaeIoQBJhvPRE+BMKvaxP7S14pFP//ji
 e4owx4aM5kvnK88exQuey7xaCFCd5DCSOes6wY6KaGM6jhbYTQM4fpqOeAVPjxsyoB1q4/eDbCp
 FFOwu/5YfyDHAMwZTRz9cbq8=
X-Envelope-To: sashiko-reviews@lists.linux.dev
Received: by smtp.migadu.com with ESMTPS id 8c636a633ece42f2;
	Wed, 25 Nov 2026 15:59:19 +0000
X-Mizu-Trace-ID: 8c636a633ece42f2
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5c14bc5a743so37298e87.0
        for <sashiko-reviews@lists.linux.dev>; Wed, 25 Nov 2026 07:59:14 -0800 (PST)
X-Gm-Message-State: APuU4Z9Zz14J52bBwDYVAaU3OE39xoO41G2YLwIXF0S6LfUM4orHDQBz
	zaK7lsF/ajaeTNk50TfBEALVChPs1Kpey8inmug2ElQ3cEorn31NOzs4YfwCuTEnCAZjuwvqOPj
	t/MA05wJQ/dpaLO1ffAPkQ24A2MyVqFaDXfBuFJfK
X-Received: by 2002:a05:6512:10c7:b0:5bf:f84f:1d74 with SMTP id
 2adb3069b0e04-5c21a27810amr593536e87.13.1795622354030; Wed, 25 Nov 2026
 07:59:14 -0800 (PST)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261125153911.106793-1-fuad.tabba@linux.dev> <20261125153911.106793-10-fuad.tabba@linux.dev>
 <sashiko-outbox-233684@kernel.org>
In-Reply-To: <sashiko-outbox-233684@kernel.org>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Wed, 25 Nov 2026 15:58:37 +0000
X-Gmail-Original-Message-ID: <CA+EHjTz1SuYC9GnMRH2Fe71jxKm1QvoE5tEopBe6k_gFNdbwHQ@mail.gmail.com>
X-Gm-Features: Aa3M54qU1hrnXAD2dBM1Uj3GqNjkJxsnaGRBLC-c83EOnBK74LQNPnC0lvVf4bs
Message-ID: <CA+EHjTz1SuYC9GnMRH2Fe71jxKm1QvoE5tEopBe6k_gFNdbwHQ@mail.gmail.com>
Subject: Re: [PATCH v2 09/20] KVM: arm64: Report an incomplete feature map
 with WARN_ON()
To: sashiko-reviews@lists.linux.dev
Cc: kvmarm@lists.linux.dev, kvm@vger.kernel.org, 
	Oliver Upton <oupton@kernel.org>, Marc Zyngier <maz@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, 25 Nov 2026 at 15:55, <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [Low] KVM: arm64: unused str parameter and name field in
>   check_feat_map()
[...]
> [Severity: Low]
> Does replacing kvm_err() with WARN_ON() leave the str parameter of
> check_feat_map() and struct reg_feat_map_desc::name unused?


Deliberate. The #ifdef was removed at Oliver's request [1], and the
warning doesn't print the register's name or the bits, as discussed
there. The str parameter and the name field are kept so that this
patch only changes how the check reports an incomplete feature map.

/fuad

[1] https://lore.kernel.org/all/avyZH2g3rrIVm-Fl@kernel.org/
