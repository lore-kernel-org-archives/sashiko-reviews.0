Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794940986;
	b=yClvbLVpa6S4N41gh5OkdsT9oCcHnfCnWwj/HxXnJ68xqIqmG4vxym1njI3AlHBwvA8j
	 7i+gNPS2TgogrjwI80Uek8xmeucae5KUDuhB6ovJbmKinkF5numjVlWUiRl/afLJ0N7Ep
	 DCSep3jYDrAQGoH4tjQ6+Iy0mHJkXNfgJSmW1FMqpecRj2JNRx29mDiAHmcv57kpVdHuS
	 smXJgCgpkRfoV/mtzDfoq6Pz7ABFg6faI7WZVcUHYogAq48RIur1//QFpfueHxkMP0759
	 w9P/F2WYOA0bSBYR3xXJC8GM3h1lo7spqAwA+cbMxNzP1FPeC4ng2WjdrjcMH8oTcJw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794940986;
	h=Received:DKIM-Signature:Received:X-Gm-Message-State:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:
	 X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=zIGvUewNsRTdPr0jJVgj2QAD5kTHSSw3BLau696dnAk=;
	b=StQ7UgKwTl6BukuUz1zTQrMSMvv0TidVBR+v3Tm6S84WoXUDcxE/F04RUdelkqi2e66z
	 BvK84vNEe55r3crwxeqjEqjHLoH7nh3w7exRYxVz7L5jwdnJPJRtF9Xkvl2L21JpoP/GZ
	 /pXzkxjP41f+lEeFa6f4VnAHbrzEJvZKUsRQCid5CxKNNyAvVowLKpZYwzL5+r2lt7lT+
	 VozF1XpiVaJAzhY1aD4JW5HwSM6xkanP/0gk1+rOtRvYbxD5pWEoWcjx7hrLayLVexkl9
	 fUJR5ecb1jpSrfxBDK0zrTaOv/OHemm0Ag27hyTOeRg3z4Nv7+FD+1ZCfRj3QZ9kGfA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VF5p8wjL;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7D7A606A32C
	for <sashiko-reviews@lists.linux.dev>; Tue, 17 Nov 2026 18:43:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VF5p8wjL
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95B0D1F000C6
	for <sashiko-reviews@lists.linux.dev>; Tue, 17 Nov 2026 18:43:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794940986;
	bh=zIGvUewNsRTdPr0jJVgj2QAD5kTHSSw3BLau696dnAk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=VF5p8wjL7PL/JS3vl0S7ntAp2WJXS4DVnjQ5iGeuX57IRLW55+VTHQY55gkOe5SAm
	 Vz0cKilSlQso0Lq+HiOli9QrY95s7qLVoWbcKxuENjYaEN7K23po4hzbt8YRttHuci
	 VqGmtFQoYKK3ttjNKS0I4+C48BR2tFozew4H1L5QEKwederraqvMsJCSpuWZDMRS2a
	 j0Iuxf2uo/5tdXINbqXNYBR7MhMWE6IeitmKG3I+iy0AC2slw0m3DLZGf42Lfvfdou
	 ILCuwm1g21kjhUKdEH1dpwxWNFgS20PvU6TgfCNQ6KGDqW7BYUwJ6Og11/dLRlfc5c
	 PSLXVMJdlpCfw==
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-3adfe77d336so2310271fa.1
        for <sashiko-reviews@lists.linux.dev>; Tue, 17 Nov 2026 10:43:06 -0800 (PST)
X-Gm-Message-State: APuU4Z9HJ8vNlqvu4ZwvfWIobjexIRtOrWDY7GPdn1bXJ9Bf7LCpeIrn
	FwNeOs3QaZV9oKb5h7nEYc5Ek6yZJcZjTfZpoh99cER2mEmrcBpuBh69KoutBvm9lhQy4/oJ7Fy
	FV+epooPmnE8yX9c1IaLb6M6d4sCsM58=
X-Received: by 2002:a05:6512:2c09:b0:5c1:5bca:d210 with SMTP id
 2adb3069b0e04-5c1a9f2d252mr12434e87.55.1794940985373; Tue, 17 Nov 2026
 10:43:05 -0800 (PST)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261116-ux500-powerdomain-dts-v1-0-e0f4459c3ab1@kernel.org>
 <20261116-ux500-powerdomain-dts-v1-3-e0f4459c3ab1@kernel.org> <sashiko-outbox-216743@kernel.org>
In-Reply-To: <sashiko-outbox-216743@kernel.org>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 17 Nov 2026 19:42:52 +0100
X-Gmail-Original-Message-ID: <CAD++jLkzqVLBa5fe3VvEpgnD6=x+uR3vxX_6sNkz5sCm5UcN+g@mail.gmail.com>
X-Gm-Features: Aa3M54qKG1kvBA8YkzUjaHtAa5J5mSXGR9jjOgrpWVnYUeSb7Ffo_T-ts2cv138
Message-ID: <CAD++jLkzqVLBa5fe3VvEpgnD6=x+uR3vxX_6sNkz5sCm5UcN+g@mail.gmail.com>
Subject: Re: [PATCH 3/3] ARM: dts: ux500: Remove DB8500 EPOD regulators
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 16, 2026 at 11:31=E2=80=AFAM <sashiko-bot@kernel.org> wrote:

> [Severity: Low]
> Does dropping v-ape-supply from msp0 through msp3 break dtbs_check agains=
t
> Documentation/devicetree/bindings/sound/stericsson,ux500-msp-i2s.yaml?
> That schema still lists v-ape-supply under required and sets
> unevaluatedProperties: false without documenting power-domains.

Patch for this has been sent in parallel.

Yours,
Linus Walleij
