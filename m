Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794781956;
	b=2TVZoKZCbhqY9rSfWayyDwWvuvfWzuyw04Z+U6YL60am8P7hSIVXBgkLHCDoy5gwlW4c
	 AVAdByLZOByfs6aOKZU8GpccwV06f02HyE95g3B+EN7nc6OavUvmuKElBhU1TDe3kikW2
	 9n8F/VUSKb3hQEeQwOl8w75PGcMrQly8C+M2ESc6+6Q1cgxZ8FiMr1UP+dX+UHXboXhzw
	 GmLsC1Vv+SyNuxNXBP6D/2c4DzdStYuy8j3X5dssFc9yog1ImcYmoK/CWgq2sCn/anuhD
	 U/INsJgMqqAZHemuDoj78lV7y3gwj2tAJgPHuh/Be2XMoYxCKJTaCWpSL7tBKcD9/Vw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794781956;
	h=Received:DKIM-Signature:Received:X-Gm-Message-State:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:
	 X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=MzQkyaMPv4q8D4QLWOBPv4zshw9aqrYoJqmnl11hZMs=;
	b=nBb6jaFq35m+mUTu83qV662kO1YompthS2J3ZlRNIsA+myPOZFbnZAL8SHiGQetc9CHY
	 Og4SDNBKcF3jhF70EG651yNWVYtETDmdM8z+iMNGMrUcyY9GtwDsUSEQ+U2bgnZNR0XwB
	 TH/W37KVaUDeB5uk912qA+p55PKkuv6hf4FgCLsRKMaG4Nzr7T5j/SundErkGq6SMK0fO
	 P8sm4Tq/Ew0qzpFgrh0w+2jz5q9JF83//hsHdO4ePBhCfBlGpL3SXaEds/gXhwN5rkGSd
	 Uialt39zhdpBxbCUUT00t7CFy0e2/JoIqM+2mKQ/7TMfiDlGpnI+1nxBmqDn6GZWuGg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="iEpMRtF/";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95A57606A32C
	for <sashiko-reviews@lists.linux.dev>; Sun, 15 Nov 2026 22:32:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iEpMRtF/
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2BBB21F000C4
	for <sashiko-reviews@lists.linux.dev>; Sun, 15 Nov 2026 22:32:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794781956;
	bh=MzQkyaMPv4q8D4QLWOBPv4zshw9aqrYoJqmnl11hZMs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=iEpMRtF/7EVYRG2DxvsK2Dkrv3fWgzw1Abgo9HSfh6SaTYWsDC/OwXiB+5+UAvEAe
	 R6/ED3iF8DAOoQxzObmphWkkpkw6+NIrJll0+H99vr/3wPr+lbHIdo8f7+69SPmPEj
	 SAur36QU7HQEUf0HS7JD+Akiwkpea6JF7GxuYBHDqjz8vzCCswwaLeT3agif6iwV3B
	 eRpc9IrVVeR5KGIOg0D+QukCM5TZFiAHoCG/BytSEj2+VctdAkGzvchV22HUi7TkY0
	 vPtqvNEJYGR4OfblfrTQMljUZHpMnCkxqs/Mbfk6aillwyQ7lFiV4OEYew6KMvsfWK
	 dS3I4p0GN3kMg==
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5be4b61fd3dso2554634e87.3
        for <sashiko-reviews@lists.linux.dev>; Sun, 15 Nov 2026 14:32:36 -0800 (PST)
X-Gm-Message-State: APuU4Z+APEHK3nkHFaBWYxluVAARrplrro1Jgdkpp+JFGWf6nPkXAfBS
	itwnuwwt1H2ItueAF76fgm/duG7adDJh/D4trtqy7Ih+ApDwEnnGurAkBs1VeL6W+Os19EkB6FL
	mJQyuz6sczSLfBVqnqRBw0CXHLjNCVfE=
X-Received: by 2002:a05:6512:234a:b0:5bf:b365:d82c with SMTP id
 2adb3069b0e04-5c17099c70amr3047016e87.57.1794781954911; Sun, 15 Nov 2026
 14:32:34 -0800 (PST)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261115-ux500-epod-regulator-removal-v1-1-f550c95dfa9c@kernel.org>
 <sashiko-outbox-215599@kernel.org>
In-Reply-To: <sashiko-outbox-215599@kernel.org>
From: Linus Walleij <linusw@kernel.org>
Date: Sun, 15 Nov 2026 23:32:22 +0100
X-Gmail-Original-Message-ID: <CAD++jLksHZV5o1pz7jyt-trdVcfikzbqAwGWS=3Kp2u02pNkbA@mail.gmail.com>
X-Gm-Features: Aa3M54pnCxVepPJQfzGLsz70QNi113T5j8VnzFHu2fZwlbNtYC97snSqxWqRx9A
Message-ID: <CAD++jLksHZV5o1pz7jyt-trdVcfikzbqAwGWS=3Kp2u02pNkbA@mail.gmail.com>
Subject: Re: [PATCH] mfd/regulator: db8500-prcmu: Remove EPOD regulators
To: sashiko-reviews@lists.linux.dev
Cc: mfd@lists.linux.dev, lee@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 15, 2026 at 4:00=E2=80=AFPM <sashiko-bot@kernel.org> wrote:

> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [High] mfd: db8500-prcmu: premature regulator removal breaks consumer
>   probe

I know that very well, the idea is to merge the different patches
independently to different maintainer trees so Lee doesn't have
to carry everything. It will be fine at runtime by the end of the
merge window and linux-next boots.

Yours,
Linus Walleij
