Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84FE53AFD10
	for <sashiko-reviews@lists.linux.dev>; Mon,  8 Jun 2026 23:13:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780960399; cv=none; b=TkFSeb5jgEimUShYAxOCf4x1eQFBUCPJMGeKa9UCBKliYVE0CMLx/TLHXi+aULs8p1TaC31iywZBpviRtonrg3E024/mJRjZGshyP6Mkpo/TiI9jfv8yYLiisLJAD96EIWC2svh2O4irm4rIo9ZQWzmhD+f7fRcr409pIhHtc3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780960399; c=relaxed/simple;
	bh=TBoN2UJwU0BX4/ums+wfEePcn2SshmSjcitmDBT3oX4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HInwKpeymL+ciTrxEUIviOVMW7RZFbp3pxv7IDmMDfG08ufmwiQWClzR5hnnEz9Xsx8QBG5ZU77wEowi8jaopPfeiRT+vK1zoeDal8aIVt9n+QI+4+2X6T44I5QOh/uaV+2qjPlASh+fwAc8CfY/vQE8UqkJbAH/d+6/l1mTVVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=m9BA+WSj; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="m9BA+WSj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F1A21F00893
	for <sashiko-reviews@lists.linux.dev>; Mon,  8 Jun 2026 23:13:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780960398;
	bh=TBoN2UJwU0BX4/ums+wfEePcn2SshmSjcitmDBT3oX4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=m9BA+WSjPvw67wqWiL9vbtrN+kDt58rcPs0luMTEZk5IzOs59MguNCBWUY8ej6lHP
	 vpyTbozR8Bu/kn6L8xlEEJh69g9aCfCu5etsKW47akTMAcyFvp03j3cJqvK9y82G2K
	 4UZY2GAeh7wb7GiHfg0rdJpF4Hx839em5k0xnGwWF07ox5QZib2jb1jQXk7Dy/y0Wu
	 LMP+ilhsH/BtxI9Xvs2rh4tmqcYEfpE8k6Evvdu1shQi7hOz4WwXWmj7afwFTD9XK2
	 oCVfJM2XZBFNOtrqg2B0XUoOc0ya4AnM6MufnzZCdCEy6FnP0l5x46n8acidSht1tE
	 FBNGgIs9D+grQ==
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5aa619653e4so5569204e87.1
        for <sashiko-reviews@lists.linux.dev>; Mon, 08 Jun 2026 16:13:18 -0700 (PDT)
X-Gm-Message-State: AOJu0Ywg0nTlcMbGKBXTSW06OxF44dap281g9M1xvnNsVxao+NDkMcO0
	6FVpNAjdXcoDGYXnX60KGoYsDqe3mjb57TapqAd0Vkza5rYnpgunrH5I8iACCCZPsqdAAfMGmJe
	zYDI8oK3KqyWyhN7m/79xHDom8tadB+M=
X-Received: by 2002:a05:6512:6093:b0:5aa:7005:125c with SMTP id
 2adb3069b0e04-5aa8866c7c5mr4118153e87.8.1780960397216; Mon, 08 Jun 2026
 16:13:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260608-ks8995-to-ksz8-v6-3-d91eb43edcc5@kernel.org> <20260608224213.C6C221F00893@smtp.kernel.org>
In-Reply-To: <20260608224213.C6C221F00893@smtp.kernel.org>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 9 Jun 2026 01:13:05 +0200
X-Gmail-Original-Message-ID: <CAD++jLkWZ5o7-P6Ju7WsFpc==JsyG67bX3MFACw+MdPD73U5bw@mail.gmail.com>
X-Gm-Features: AVVi8CfncQFjJPKP7-0RhQ36yDJsgC7yxNCRxag8FPChj9f2T-6Pk3ldIhzUrZo
Message-ID: <CAD++jLkWZ5o7-P6Ju7WsFpc==JsyG67bX3MFACw+MdPD73U5bw@mail.gmail.com>
Subject: Re: [PATCH net-next v6 3/5] net: dsa: tag_ks8995: Add the KS8995 tag handling
To: sashiko-reviews@lists.linux.dev
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 9, 2026 at 12:42=E2=80=AFAM <sashiko-bot@kernel.org> wrote:

> Thank you for your contribution! Sashiko AI review found 2 potential issu=
e(s) to consider:
> - [Critical] Double free of the socket buffer on the error path in `ks899=
5_rcv()` when `skb_vlan_untag()` fails.
> - [High] Unhandled hardware-accelerated VLAN tags bypass clearing and bre=
ak the required DSA tagging order on transmission.

No.

This is how other taggers do it.

If something is wrong it points to a bigger problem.

Yours,
Linus Walleij
