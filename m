Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B44A4846F
	for <sashiko-reviews@lists.linux.dev>; Mon,  1 Jun 2026 07:52:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780300344; cv=none; b=QFCI+6S2gKZThzu3AV5n3MIKnJP47esi3koeKbGJx3u/V1bHkaZQ1+Txwm0SkmJlGV5nrTtMe+De+Tse95R+17iBxrfR33whv5lC8l3OAOpZxo6PlI/chvek38KiWBdm/ooGtN7vZzB9C2fFkJ90oJ2WT4pfHE+YYPjArkeSBB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780300344; c=relaxed/simple;
	bh=S93VjxghpCSARF+0MX+vdNAfm+3xIHNf+egt1cEOk4c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SqezkreMSrUObcDsuR2kp1HU2/o28J9KAyFwuTHaGx3ezXZFiE96G5LcacTAroD8BLcPUh83Cxwx8YI5VT1zCCtWWuSgVNrKLtBAGTBkM0I3+almT4q/aSXXSDUCf7sgUDGYiUgxJX4cE+5UB3hlTDGB661MHWVc0s6b6F5T6Aw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jpEWWN3y; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jpEWWN3y"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A0F91F00893
	for <sashiko-reviews@lists.linux.dev>; Mon,  1 Jun 2026 07:52:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780300343;
	bh=S93VjxghpCSARF+0MX+vdNAfm+3xIHNf+egt1cEOk4c=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=jpEWWN3y8EELrU7VF8bXhW4pvssZWZ0y+dJjhn4UoRLYrAh3Q34nbByy9T4AaSCAH
	 hcGXreV5lWzA2rMjBvdA7c32T1qYT5jQkTYtqSdNiYj4UrvTufKlaQ4hBDaKTdS6wF
	 m7PFrZgf6x9XaD8jqjWJfkaW2pBR1oOqihOvAxaa001HB/x7Xk/LonN368ln8i3IZG
	 mtG37WtyBzvGFBKzUeIjoZqHL0Am/4AxDsU+elzZ0/J7/ZSf4W2VisnC//NwPKSyb5
	 yN7fUHpg6rMIdRUO1I2NvrnO4C6xWidryr7Uyga1kiyl+MTzSL1q9VXco4idHVJl2r
	 hcd3I1OLJ8S8g==
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-39664fe2dd8so13850501fa.3
        for <sashiko-reviews@lists.linux.dev>; Mon, 01 Jun 2026 00:52:23 -0700 (PDT)
X-Gm-Message-State: AOJu0YxGQhi0N3CU4JkH/wbhp2xrYh2fuBpHf9Zt3NOd0F8kEKxegZV5
	P4W2QWw1+HDvGbt87x4wBizS3B21CJGXKDk8eHHkdYKnpX7/NMwfmGZ67dOrOWnwk09MwyS3E+t
	VBNgRA8C7ZT3s5yzKhYAJ1F0AurXzYDA=
X-Received: by 2002:a05:6512:304e:b0:5aa:6289:e0b8 with SMTP id
 2adb3069b0e04-5aa6289e337mr2990261e87.32.1780300342231; Mon, 01 Jun 2026
 00:52:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260526-ks8995-to-ksz8-v3-4-c530f651989f@kernel.org> <20260530004901.F23501F00893@smtp.kernel.org>
In-Reply-To: <20260530004901.F23501F00893@smtp.kernel.org>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 1 Jun 2026 09:52:10 +0200
X-Gmail-Original-Message-ID: <CAD++jLk-6cqYZ9WadULSm9sKmTMg+JB6Q_MV7owNiLgFNk+unQ@mail.gmail.com>
X-Gm-Features: AVHnY4Jk7dVwp-hot0WGeyRcZI01lKqYMcxnllSkQd4Fn-nQAi31w1vmDuDS-R4
Message-ID: <CAD++jLk-6cqYZ9WadULSm9sKmTMg+JB6Q_MV7owNiLgFNk+unQ@mail.gmail.com>
Subject: Re: [PATCH net-next v3 4/5] net: dsa: microchip: Support Microchip
 KSZ8995XA / KS8995XA
To: sashiko-reviews@lists.linux.dev
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, May 30, 2026 at 2:49=E2=80=AFAM <sashiko-bot@kernel.org> wrote:

> On the KSZ8995XA, offset 0x0C resolves to Port Control 12 (e.g., 0x1C for
> Port 1), where BIT 4 is Receive Enable and BIT 3 is Transmit Enable. When
> updating MII_ADVERTISE, the emulation applies PORT_AUTO_NEG_SYM_PAUSE (BI=
T 4)
> and PORT_AUTO_NEG_100BTX_FD (BIT 3). Clearing these advertisement bits
> appears to inadvertently disable RX and TX on the port.

No it is not.

Sashiko has not read the right datasheet for KSZ8995XA.

Bit 4 is "Advertise flow control capability" etc, just as expected.

> Similarly, setting PORT_FORCE_FULL_DUPLEX (BIT 5) via MII_BMCR sets Learn=
ing
> Disable. When phylink automatically configures the PHY on startup, these
> writes could execute and completely break the switch port's network
> functionality.

Just no. Hallucinations.

Linus Walleij
