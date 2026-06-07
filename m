Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DCB1327BEC
	for <sashiko-reviews@lists.linux.dev>; Sun,  7 Jun 2026 22:41:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780872079; cv=none; b=h0GxdikYQiFt9YAIPw5b9KhCgelPaUAmgIjHDbGkcDArH8oJbE/cupBIc72Qua5b8RPeVanOQKHFvQJnDOuHo10gRLoGx/VF/H2p+bUjGrgM43rpJDGX55eP+z3eAa3FliWpx+Z9fnkJLDLL+Y1V+Q78khNvqS1SlNQW4c18E2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780872079; c=relaxed/simple;
	bh=3e/tVGTtkLnH6sT59kT87xrrsS5Cu/w9zzhTCU7nFC8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qq1YC88GyihDZstWM5zspay31cjcGqIHizY0GslFNtHTsl/HqrQlMg6thLzSmm4WMV92bS536yWxFlTbyhwE9Wq94wqK85YfrrKxkoWE4Vf9iSPLTbOOJd6X2Mk4is7OupQThO+8MTTsRK+k6TF8uGZYL0WMV0WjP9STdTgiRl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EKHOvmCh; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EKHOvmCh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC6631F00898
	for <sashiko-reviews@lists.linux.dev>; Sun,  7 Jun 2026 22:41:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780872077;
	bh=3e/tVGTtkLnH6sT59kT87xrrsS5Cu/w9zzhTCU7nFC8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=EKHOvmChPycIxxvJZDcFNuRQXDOgu3Alx0rFSMymcVEN53ozHA78sZYti4I0vrpiD
	 LxnRgDvKGON47DXuQ3cLmq4tjHEM9U2PhyS1WuoYx/IRMX1k8KOb9RtN0WeBnTt1Th
	 k8ei3SAe1unB2hSdB7V4KowR5CJo1FaRfZLHjSy4P2Ti+h9fzqvqkAaqmT/drjsT8I
	 02CSzc4B905w6xuOKEK8pD9nPo15uSOTmjPtEP5ICFrZnUy0tjB9LDPDmnnMck5UVl
	 t24XhyzC0KABLWoE+BsgMho5jBRe7gZG1Ib578LJoxxVN7zgnEwcExQn2BSsJWk2I/
	 Fl7+jpja3rr9A==
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5aa68cf9123so3764053e87.0
        for <sashiko-reviews@lists.linux.dev>; Sun, 07 Jun 2026 15:41:17 -0700 (PDT)
X-Gm-Message-State: AOJu0Yxj0KPnCYsd9quXIWlwsdAtR9ujKLQnTm52f34uOvdbW7FRF7QF
	Aim8V7bFWMqZ7lQ6VYzEiwULIRD6HpYIqaI1kIbFXzOoB1q7Tce/QuyTy73qV3yg3OnINOwUjcX
	3lrx+oql6kW5H5Ob30JBDJvmZ8tWfSAA=
X-Received: by 2002:a05:6512:460f:b0:5a4:56:aa88 with SMTP id
 2adb3069b0e04-5aa87c233e9mr3101009e87.27.1780872076689; Sun, 07 Jun 2026
 15:41:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260604-ks8995-to-ksz8-v5-4-98baeb45e665@kernel.org> <20260605081651.3DA0D1F00899@smtp.kernel.org>
In-Reply-To: <20260605081651.3DA0D1F00899@smtp.kernel.org>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 8 Jun 2026 00:41:05 +0200
X-Gmail-Original-Message-ID: <CAD++jL=6NJXzHYUgqGAE=tOK=bSPw1r3MEbCRW4xseySwevJMg@mail.gmail.com>
X-Gm-Features: AVVi8CeQFk2oyX8jISQg6QRF0fQawiGN5q1a9TixwKrCRoNjBKuyUnpVUWo-ZoU
Message-ID: <CAD++jL=6NJXzHYUgqGAE=tOK=bSPw1r3MEbCRW4xseySwevJMg@mail.gmail.com>
Subject: Re: [PATCH net-next v5 4/5] net: dsa: microchip: Support Microchip
 KSZ8995XA / KS8995XA
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 5, 2026 at 10:16=E2=80=AFAM <sashiko-bot@kernel.org> wrote:

> Thank you for your contribution! Sashiko AI review found 3 potential issu=
e(s) to consider:
> - [Medium] The switch reset sequence for KSZ8995XA writes to a read-only =
status register and an undefined CPU port register instead of performing a =
PHY reset.

These registers:
- Exist
- Are writeable
- Also for the CPU port

You are looking at the wrong datasheet or got it wrong.

> - [Medium] The driver assigns `port_mirror_add` and `port_mirror_del` for=
 KSZ8995XA, which lacks mirroring support, leading to reserved bit corrupti=
on.

Again wrong. You're reading the wrong datasheet.

> - [Low] The `supports_mii` array incorrectly advertises MII support for i=
nternal PHY ports on the KSZ8995XA.

These are accessible and usually used from external MDIO.

Yours,
Linus Walleij
