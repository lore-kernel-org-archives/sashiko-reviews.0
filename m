Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E35E3AEF4E
	for <sashiko-reviews@lists.linux.dev>; Fri, 24 Jul 2026 07:45:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784879112; cv=none; b=ChuCU8+7FsC30UXYRfHB9HhJIuHd+vwaKZkkeR+IUU/DtWAKOouXp8yWojPpdUgxwLIPE5CKq/QusNBjb2wnM0bo6RNnhCjQToDrla5pu/K+ShHLb9s+lmT71kB/ois4ni/9zz67Hhiyb2w6x+lIgr9rzuENm/H7kv3Wvx6nZUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784879112; c=relaxed/simple;
	bh=JOkH4bJPZ4oxOTdkNXcqPnL97AALaEla0GzprUGCIPA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Mq1cMIcVvr7cOS9yxwIEVJbwOdYZ3qoXM1KPLdL+3CyZnOYZgiLTrrc/S+sDaAt4DVXVsD/w52q1mf8fZzPN9ju48/RUX0+MDZIvnCAKoKnxoq4/asH9x7ivnE4GiCyXCOzHtR3e+EDMX6/DYnyAguWqmHc1OVgOnEg2PeYIYok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M9SqYyMc; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M9SqYyMc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 148611F000E9
	for <sashiko-reviews@lists.linux.dev>; Fri, 24 Jul 2026 07:45:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784879111;
	bh=JOkH4bJPZ4oxOTdkNXcqPnL97AALaEla0GzprUGCIPA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=M9SqYyMcNdKDeEiTzusuj7XKglRPdxXehjJeB173s8d0iBxD3PayDZliz5zFOyE8c
	 caSt3bXwlcYZj8g7tGcp5A9KSiuF2YDSzpOL/fcxb7EG6ztt99VSCP9biqfZQU0BVZ
	 NdbeYkKfX8I+Cph01vgfrjwFU1KhgmeBWsUjd7Bai1vUwKhgqjiVi/RavCpv6p33lC
	 I+wcstKtHnfZPwdfUQH3sn0WZrr0zWF0f/t9IiWG1wBWpK70tkMMZVXofcmgS3KlJj
	 6smJ49mQ8XofhULpciPbaXD/dbduEJVQkrQXI9oXCY4WbVIglLMsDyNir0y8WBnadq
	 GgmKZgnPD/Daw==
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5b0117dda13so147989e87.0
        for <sashiko-reviews@lists.linux.dev>; Fri, 24 Jul 2026 00:45:11 -0700 (PDT)
X-Gm-Message-State: AOJu0YyxGoodJTy2/lo5xtbZutKo3T+tkfMI0Eu86Uv33K3EFK0wpfW5
	teHsPujNw+wVFu3C9Px2KKrWyTCg2CO4NMAFwhbW+CKcklx41W5eAUbx0sz+u4ln+q39X2pkKjt
	DU7uEhB/Pg8RdtN2Rsrk8Z+lkfw3/dNw=
X-Received: by 2002:ac2:568f:0:b0:5b0:1c19:2cf8 with SMTP id
 2adb3069b0e04-5b2b2f5b3bdmr1237296e87.11.1784879109866; Fri, 24 Jul 2026
 00:45:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260709-ixp4xx-little-endian-v1-0-e9622d0ba9e4@kernel.org>
 <20260709-ixp4xx-little-endian-v1-1-e9622d0ba9e4@kernel.org>
 <20260708224834.138FC1F00A3D@smtp.kernel.org> <CAD++jLmUwxEdEw23H0sk6YsBCVDPLtY_SA=SeBRcxf+jTO=4tQ@mail.gmail.com>
 <68d6b870-593c-47f1-aaff-373a448e518d@app.fastmail.com>
In-Reply-To: <68d6b870-593c-47f1-aaff-373a448e518d@app.fastmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 24 Jul 2026 09:44:57 +0200
X-Gmail-Original-Message-ID: <CAD++jLn-4YR7HONhRhSUEikhamy87gY7N00CWNECy-9O-+2GNA@mail.gmail.com>
X-Gm-Features: AUfX_mzgMeefpXCB53sxClSIpJp5_NO7r4doCUj02ZlVId0gXik_zvqvRjssp48
Message-ID: <CAD++jLn-4YR7HONhRhSUEikhamy87gY7N00CWNECy-9O-+2GNA@mail.gmail.com>
Subject: Re: [PATCH 1/3] ARM: decompressor: always set endianess on xscale
To: Arnd Bergmann <arnd@arndb.de>
Cc: sashiko-reviews@lists.linux.dev, Conor Dooley <conor+dt@kernel.org>, 
	devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 14, 2026 at 9:12=E2=80=AFPM Arnd Bergmann <arnd@arndb.de> wrote=
:

> I think the version you posted makes more sense as this is the
> officially documented sequence from the manual.
>
> The potential bug I mentioned is with the instructions that are
> already there, not the ones you add, so nothing changes there.

I updated the patch in Russell's patch tracker with this version:
https://www.arm.linux.org.uk/developer/patches/viewpatch.php?id=3D9482/3

Yours,
Linus Walleij
