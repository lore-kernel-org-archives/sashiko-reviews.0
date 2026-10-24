Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792871077;
	b=OV8GOB9qT7hGSFh6Jfcb3s9EHQ9w/c1Ao2D8c10QUQ8iR59u86fBJbjA6fdx19CQFhSG
	 q0ktAZpgZZvHiYGN0R5oxh6h/yF7FNzijd/P78KTh0kAGJNMy0dDlYKbP5GPfktGMbWt/
	 Jecj0uNL5Xol6uuA/weSZb+1xQUpoY+XXvyVy22O2NseRz6qlTEgLXSvAJkQpTZG7kpqc
	 yDzhk6thlM5LR1DnuLjw5nuDBtOiVW33W+ej22fXorBfSCqPvS8C+PH1jTTyrcbouUwAj
	 gDPzGQ5HJHidBFqanCPTZO5NBJxhO8lfoHi65ElkMhynl8hHVFvSTtDJlYduUkwnixA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792871077;
	h=Received:DKIM-Signature:Received:X-Gm-Message-State:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:
	 X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=mh4dVDe9piAOp7KaDFYQNRZ05jy6LwP9crYy0+FRaUo=;
	b=CxSSQfm1Fh6uwlj8g+vNlib/D0zBebKUW5+pNTmE6jsO245cdKr4iP0Rnyqu0wvOUNx7
	 sOl+NWrmvW6blQxyVZehZ6nIoLpp+6sGptHZFA3IF0FuoXi2FD+M6zSyCFYY2QBqLppFg
	 /OGxJzary1egQMinJZ1gFbPu2Dd+ifT81h0nWIRrI7k+AwUlOJ7XGJY3+ZsRWYPTg6PZz
	 ybgi+4WFo6PnltZYd6i6pZH8BI8/LnugnOdNmkCtYWZft2IPNKEX1AqTOrA8VtwjnGNY0
	 TfCMBxUpKTdxOGO2gcc8wLMEwAV4i9zaNLFjAYFecw9mz5p9agWLsLslUVgJOVUoRMQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="m42Rz/iE";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BCBE606A31A
	for <sashiko-reviews@lists.linux.dev>; Sat, 24 Oct 2026 19:44:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=m42Rz/iE
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A7B41F031E0
	for <sashiko-reviews@lists.linux.dev>; Sat, 24 Oct 2026 19:44:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792871077;
	bh=mh4dVDe9piAOp7KaDFYQNRZ05jy6LwP9crYy0+FRaUo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=m42Rz/iEUsog1pWTb7GnHmqNTKFBf+Wm7YXxkyivgn+m+VPCvhbo9JDUiqNCSXokK
	 GBfne6GgL7xWVLhrDa1sJkVIVZj5XYCyTDf2KLpEoh9SrB34eyWdG3vVGM02WISBJs
	 BiLs43MlMyo89M63kdQM0nScVyb1OcklvGimoeYJAVx2907CCyAXqNwsQuTYC3cMTS
	 6vIVMvugZkpa7rVBusdp2bkfcqvvYl/SxStTcU1WSoaI+OkseZrQYCjyNmjx6kyx8b
	 syekTIFaMm6hKtw/l/AJOeL4ZHZJ+r4zsvU/T9I773BbBI2fkIsjDntSPTimm0Oa7J
	 Mx+dn5CgX1PKw==
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5bfa686881fso1401614e87.2
        for <sashiko-reviews@lists.linux.dev>; Sat, 24 Oct 2026 12:44:37 -0700 (PDT)
X-Gm-Message-State: AFq9FYKZrigK14CzCMEz+xxdPYKHnLyjzizM/Zk9cqf/xcb61m9YATEs
	18UwaP6wyb9ZlHuCAZ5B+COs8vwQz/uz3KtxqUFK3hXKKlvnkrUOnZigEko84TsZ+kTkooKBQf5
	Doqz5r1TnGWtKXRQSDVPS5KdXuhBU5XE=
X-Received: by 2002:a05:6512:690:b0:5bc:c9e3:d5bc with SMTP id
 2adb3069b0e04-5bfb71d4723mr857819e87.29.1792871075927; Sat, 24 Oct 2026
 12:44:35 -0700 (PDT)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261021-genexis-xg6846-smp-v7-3-rc1-v3-0-7c871f1755db@kernel.org>
 <20261021-genexis-xg6846-smp-v7-3-rc1-v3-3-7c871f1755db@kernel.org> <sashiko-outbox-180435@kernel.org>
In-Reply-To: <sashiko-outbox-180435@kernel.org>
From: Linus Walleij <linusw@kernel.org>
Date: Sat, 24 Oct 2026 21:44:24 +0200
X-Gmail-Original-Message-ID: <CAD++jLn-K5XOzNwPQpZk5=Oi=CvrpXxPLOs_5Om=nKX2TBw8dg@mail.gmail.com>
X-Gm-Features: AclHuK_D-MhMzwKebW1P8AbeD6JK4vbtraKHhtaYg2C22aczG200WdeX_DEjAK4
Message-ID: <CAD++jLn-K5XOzNwPQpZk5=Oi=CvrpXxPLOs_5Om=nKX2TBw8dg@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] ARM: dts: broadcom: Use CFE CPU bring-up on the XG6846B
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Sashiko,

On Wed, Oct 21, 2026 at 5:29=E2=80=AFPM <sashiko-bot@kernel.org> wrote:

> Could removing no-map from secondary-boot@0 while leaving no-map on the
> immediately adjacent pmc3-firmware@8000 node cause a boot regression in
> adjust_lowmem_bounds(), prepare_page_table(), and map_lowmem()?

Well the device boots and works fine so you are wrong.

Yours,
Linus Walleij
