Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D2544A0F15
	for <sashiko-reviews@lists.linux.dev>; Mon, 14 Sep 2026 20:42:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789418531; cv=none; b=egywqAg3B+zxDMpLLegA2KHeTO7U0nTWY5GWJuYDeZDQvV5de+EEYlWlP+J10EQn/i5akqNFGRfxkNnULWrZosRLbWlfAeIMgzmBuIGYYKj2uwkzLZ+j6OMDnygctjRQGqRUuIalblaqPEJ7gjBXQ6lovFqRbk5RbgMxfOMKbb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789418531; c=relaxed/simple;
	bh=xLBwIg9EwYsNi7YU/G7iiom+8BVuvjOa+9ZI1dLZqII=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NxXap2PEHo/O1bs3etSs07v83Lj4p4Es8FMxht+T2CrDVpL1YOwwaNRR9uk/sLvwaHi4JS5SNRy1fxkG8OLjOUI+tQLKLSwr3y5sAGKVjOTrHSCs1VG56ZDNyjD0XpdiAL00X9QIuVVVLO10KZ5aUmRCshUQX8pF802a8oJ1nmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V/m2H66H; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V/m2H66H"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47A1C1F000FF
	for <sashiko-reviews@lists.linux.dev>; Mon, 14 Sep 2026 20:42:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789418528;
	bh=xLBwIg9EwYsNi7YU/G7iiom+8BVuvjOa+9ZI1dLZqII=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=V/m2H66HcmQkQrkLSwAfd5V8gcfWAr21unV6/Hg/RXHpWyk3hRRTWUbwc8JeFk8lO
	 jCSTLCIBrWIhtCUB2JivTWVcQT2jTxXLdcgu4j9iYntxnK4TPJfKSCaOcVAoTy/YMT
	 N9tNMiBdlhGfPwqBwEZtVS6vZg6ikHZFcmfzOydnRBiGRUINPZgocsWsOfa/7Vkkz5
	 bJLp9TF9g3ldqMVlSb6nuvke+IAUfmJKqYnKQZPzIoBfWKiqOHmtSDsC93qdqB6GM/
	 2qbEtuLN0DpEZAXUmijNRmduX+mvSviXtkS4qqMRJh4twssuSptf20NZtVQAVyBCXe
	 kE4ADiiOXGCAA==
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b5e4f1744fso3658397e87.2
        for <sashiko-reviews@lists.linux.dev>; Mon, 14 Sep 2026 13:42:08 -0700 (PDT)
X-Gm-Message-State: AFuF++kCcLoqFhiHLBjh/umRZ3f+lhnZmfvmCYcSIX14QMMxo2ZLlBw5
	+w0UVnlN1J/hN2VqTobCEAmJv6if07MsrCK+0at7XGf61HvdKSD0Hn2i308Tt6JLa91F6Fyhv6r
	5ATt/XB4NtTStSRa4bNOm/kPbwF+GwKc=
X-Received: by 2002:a05:6512:2311:b0:5b6:183c:5ca0 with SMTP id
 2adb3069b0e04-5b8ae6a5697mr1072184e87.62.1789418527005; Mon, 14 Sep 2026
 13:42:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260913-ks8995-to-ksz8-v13-0-327b16d309eb@kernel.org>
 <20260913-ks8995-to-ksz8-v13-2-327b16d309eb@kernel.org> <20260914195724.C15A71F000FF@smtp.kernel.org>
In-Reply-To: <20260914195724.C15A71F000FF@smtp.kernel.org>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 14 Sep 2026 22:41:55 +0200
X-Gmail-Original-Message-ID: <CAD++jLmnh+dBTr7OiQ=3BRC2g2Hic9LnrQ+=GQJL==gA11astQ@mail.gmail.com>
X-Gm-Features: AcwNN1UwhN-0JboAQCMTsnJVo52bIt_Q8uI2Avhv6cSLm1jRuWuU9cW8jmIi_rA
Message-ID: <CAD++jLmnh+dBTr7OiQ=3BRC2g2Hic9LnrQ+=GQJL==gA11astQ@mail.gmail.com>
Subject: Re: [PATCH net-next v13 2/4] net: dsa: tag_ks8995: Add the KS8995 tag handling
To: sashiko-reviews@lists.linux.dev
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 14, 2026 at 9:57=E2=80=AFPM <sashiko-bot@kernel.org> wrote:

> Because there is no custom .flow_dissect override here, the DSA core fall=
s
> back to the generic flow dissector, which will use the 8-byte needed_head=
room
> as the RX tag length instead of 4 bytes.
>
> Will this corrupt protocol extraction by skipping 8 bytes into the packet
> instead of 4? This could cause the network core to read an invalid
> encapsulated EtherType and break Receive Packet Steering (RPS), Transmit
> Packet Steering (XPS), and Traffic Control (TC) rules on the conduit
> interface.

That was actually a really interesting find so I send a v14 for
fixing this alone!

Yours,
Linus Walleij
