Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794874266;
	b=fFFe+djifbovp6hlANhw/7P4Iuygv7AJf2gYpO5B+D07tjo16c/CaUXPxid6NjJkCprv
	 uuraoivFt1YKixtfuwxIUKCBaKnJ4oovD6u1UjitBNWNf9HYVSLqvR7o1gJOyZSophAJt
	 tKgoSmB7wux5//gAkRwaB4ywKQkkjnfNkGOwO6Mhh4rLBzTvpUEfffBduhoAOUbJ2/a5B
	 rDjOkO6J6hq1Ev3AQQPY4pA4ho86YyW00CFnUDxUibN6nhQZLOSkCK4glW+D5xLjLnEva
	 sfMpCi3cabXbAOo1F5nAo4Jl4wp/HWwdlB5Lm8VkyWuqd5E4oLge4P+AMaOP2UGNx/A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794874266;
	h=Received:DKIM-Signature:Received:X-Gm-Message-State:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:
	 X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=YjKQ2PdbHkjHFZ+hN04dl+fGzrnZtXKbmZaR+wm1jOg=;
	b=Se+qAeZhrRGGEtK0ARmENkKC/akP6/xLUqPg6Kag7qQug9mIQnCv/u/TNmNq5T33zDDh
	 2QvpAMgJ/DdJDDKgOQg5Wq5Auy3LwIvcT3DTCVJNo4idFGKOV2FBpxmEeuBrfIJ9acJot
	 qG2ZcahtfnXeGJMwEGaBQNaN0Qp17wGHw+XdUtYhIjixeNDC08TaNsVuppJKVvDlcJ8r0
	 6q8aUA5ZbIre/ys5ixW7JPQm1oEV3zVNP0tROVA0nXVnAd4Ly9m5V+LIxA8DmFML2Hpym
	 gYkLl24hivZDHOV1bbI4iz8xjL9EJIOeR/LtLkvtS+6VfbvGxdyKDASQiTeW4D90dKA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QZGxqJln;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 050F8606A323
	for <sashiko-reviews@lists.linux.dev>; Tue, 17 Nov 2026 00:11:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QZGxqJln
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6F2B1F000C8
	for <sashiko-reviews@lists.linux.dev>; Tue, 17 Nov 2026 00:11:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794874265;
	bh=YjKQ2PdbHkjHFZ+hN04dl+fGzrnZtXKbmZaR+wm1jOg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=QZGxqJlnFAM93hsizrM154QuW/4jTifan+hgL0/vdwLtJ7Sa3Kt9qXsYyx0Dn9IcO
	 KBYlZmf2GmhMlpygHXpgO3oYd433qlxTMOAA4/GDa2TkY6jS5OC+SJFz5xnjtoSoDD
	 8fKTcIZPrHMnXKlUozahNvcnL/CRVq0OyM6qaSk0EHl+0Rcv2O7gE276rln/sjy82H
	 8V7krPMh+GTWYREisb8jxAFtqyIWTyUXxn4nFKQs5GkClcVxR/rdfjKT+oON3aHd8M
	 Y8RSZKVka5gmPed6iQ/XR3zK+9m7fwofxSbCd/gcr12TcdNXWzuEMAi5iE29rSSHZC
	 O2CdyMDCf+Uvg==
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5c14e307f29so4633647e87.1
        for <sashiko-reviews@lists.linux.dev>; Mon, 16 Nov 2026 16:11:05 -0800 (PST)
X-Gm-Message-State: APuU4Z8/xcQrf83/J0xLKGaLErzeanCTHALhG89zevi6pJhacleyZFMz
	voKjYVTVSdirp4HE2iAIgeFZgoYZV5OScegBWm0qwn1UcnNcM78Xkx6H9eCrDgWL27OVO00RwZu
	cYSb1bAsvH2mYk3TPkbiF+6t7lXo6I30=
X-Received: by 2002:a05:6512:230e:b0:5c1:4f2b:a2ba with SMTP id
 2adb3069b0e04-5c1709f75b9mr4513682e87.34.1794874264502; Mon, 16 Nov 2026
 16:11:04 -0800 (PST)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261117-xg6846b-bcmbca-xrdp-reset-v5-0-f584e8b8e696@kernel.org>
 <20261117-xg6846b-bcmbca-xrdp-reset-v5-1-f584e8b8e696@kernel.org> <sashiko-outbox-217953@kernel.org>
In-Reply-To: <sashiko-outbox-217953@kernel.org>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 17 Nov 2026 01:10:52 +0100
X-Gmail-Original-Message-ID: <CAD++jLnNALhUhekMvUxes-+Wmq+g01Tck9NNvViy+ofFSL+N4A@mail.gmail.com>
X-Gm-Features: Aa3M54rQwu5Yk_Bv4F8GS-3F1wpvPataOkYjkIAgSEJnOZCG3CWzAbrtg66X8GU
Message-ID: <CAD++jLnNALhUhekMvUxes-+Wmq+g01Tck9NNvViy+ofFSL+N4A@mail.gmail.com>
Subject: Re: [PATCH v5 1/6] dt-bindings: mfd: Describe the BCM6846 PMC complex
To: sashiko-reviews@lists.linux.dev
Cc: mfd@lists.linux.dev, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-hwmon@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, 
	lee@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 17, 2026 at 12:57=E2=80=AFAM <sashiko-bot@kernel.org> wrote:
>
> [Severity: Medium]
> As reported by Philipp Zabel on RFC [1], why are power-controller,
> clock-controller, reset-controller, and hwmon modeled as separate
> address-less child nodes rather than putting the provider cell properties
> directly on the brcm,bcm6846-pmb node?

Parroting Sashiko.

This question has already been answered in earlier iterations of
the patch.

Yours,
Linus Walleij
