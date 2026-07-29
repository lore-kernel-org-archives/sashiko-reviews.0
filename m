Received: from fout-b7-smtp.messagingengine.com (fout-b7-smtp.messagingengine.com [202.12.124.150])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 972683B059F
	for <sashiko-reviews@lists.linux.dev>; Wed, 29 Jul 2026 15:40:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.150
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785339656; cv=none; b=iwYRgU+6cnJ7QQPOPrGTi4KLIt9Put9moaogI4YsPj1mbo8PtYgKubMH4UQICZ5NImA7QzMjCZ2h1HTG8mKdD4b1Y6RLQPLn3+IOLg/p/7deoEpo6yiJq49n/Vl0zosr3VTGQbfNMEGi0A8+Hr0lO/Uad1f5waObqDyFlDK3pDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785339656; c=relaxed/simple;
	bh=90xlZCHGERG6HZAxBEuDA0DR1eC0g6w1+uITJQ0xSxo=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=o5Wg60pkYIllTYBncBLDJ0H47jUv9C6gc9uvH8ebGrDcKCtyE031Nwszr/qPtWBzLAbFWYOBlyJem0VMdaJTSXCWbUeig2fPU0RaG8s4HR9fvEyWufj3rs9D8K7WyA+2zu9cgCFZHtHMZlGcErwmzyxLRFXZXH353Zestr2Qp5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=M2THynJT; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=G+KNqyMj; arc=none smtp.client-ip=202.12.124.150
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="M2THynJT";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="G+KNqyMj"
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.stl.internal (Postfix) with ESMTP id C9F6B1D00150;
	Wed, 29 Jul 2026 11:40:53 -0400 (EDT)
Received: from phl-imap-05 ([10.202.2.95])
  by phl-compute-04.internal (MEProxy); Wed, 29 Jul 2026 11:40:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1785339653;
	 x=1785426053; bh=6Ie0u229tgjCNAJxfnC1vCgZmqAKgOHrcQvE7FrYe18=; b=
	M2THynJTp7pu9cxoGmcUKCJEPij0T19mbttJMEX1FeY5/UNRuWiWOthlYYqDWMjZ
	xtvKylvmg1Ey+88jSE9o3XsA2R4+Hu3TAg4nMVd5799QoLWiS79OXtS555B5LlTo
	I53SgJg0xavRNyhXPOQaSV+Rg8m8Y6NKDzU/0zvzJwa6+xJO6lgxxIrasyrWmbIk
	GRn70MKUP3mask2zubUdoy2QiSrieT7y/zIMVNlzGS8LSMo40Y3Bbl6k6Gr0lRDU
	oiLLnC+c7mhusq+xjKTPjJKksOS2hTimydph0EFZw9YvU37p8rCYWP+wrZrSYNi9
	nVWRQwcOtvh0uyfnxSTs3g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1785339653; x=
	1785426053; bh=6Ie0u229tgjCNAJxfnC1vCgZmqAKgOHrcQvE7FrYe18=; b=G
	+KNqyMjTjbKKV0bpqVzBPbqS7nzHnpPaq9LdBEpVMzVaieqTj6HiUG3vTJynHY7m
	Cb/Y4jKimOO0jpDklzd0w6L5CiQ9wS9ujx9seLKmLHxAUFwHxwsuT6bbYkANz3az
	7Y/jv1zbT7nDNi1y3BcWGEZx/hyMjG3wGQjpzNm9YUNSid/9GWIUyMwKWT9usQdZ
	B03kvPB28A53vm+mkHcyQwMhUoohsbZk1Mkln6MeXbLmzTJ2MbBXPd/NrQxAt7Sl
	t9NVEqByldyhWIKIQNDmwDca5IJvS6Ei65bWiR0JUV/bMHeubPwsXBEuw8cFpNKH
	EmiFuXl91GycZ/Bw6z4dA==
X-ME-Sender: <xms:BR9qajK6PE8sPAGxCVVT5s_rcRkrzTmC_v-Lx-KOKT4VTeH4OfZnAg>
    <xme:BR9qah8HyynOXE2sFsn82bAWtHo9P1gUX1JYN9Ib7wkbKU1yyXDVfnKtXhAxDIj9v
    ndhwUfKpL69GiZ3SW6_mxqAsGE6FM95cQPHWyAnNXnc0Rh08xM-icY>
X-ME-Proxy-Cause: dmFkZTEYIah8wgHZ0IEArr4Wqiun95d2axgnG5Z45HsLl8hjl/pZg3kl127CKXoheS0Xrj
    LICHaOn+3evQxDMv443CFQ80vs/2J4R2qaHI9pkuEblsRQi/rYz/MpvncQdfpRyHLGiQq+
    klo4OBFX5oVn+JWqvsCG8JJTfFDlK9P/VZEHP0PBtuHD2eMu20oqRNJtesXBEp+p0Fe5gu
    1M6Rlw3CshwmHJXf4sdWZllHYUH8XYdDcdemUNO8SEigzhsIMAgHIA3JtSfPdg7An6Z+IB
    IWG3idkA7HlkPMRMTP6ahz9WQ9noyX4/g9RJMpzFWDAykHD2yL6/KQRlrMtpLf18GAkJGt
    98ZhXfXljDUYt28PKEQHFwRl1qNq31qUQzqZkhvwIFEHp1lgWl4L2v+OSrxDgz0zdsV2sf
    3yu8WM0+AW/gSTUrgSvdQJEvFzpbe7bWLa4xExsjjYlW7Y5GV8Qj8C7UFONngeni+mDXW8
    OxJcsI6lFqsKoc4AA1OHNxreISC2CYz9QaWmzphNlMfyrdXbp/8hDmWxHLT9LeMjM3EBwY
    i7Igc7QhTXy+ldy0ZB+cdoMYJcFxzzhKXJy6tqLPu52wCV86sgREPMqN5c2viBwxR+zNQU
    RT8ml9HgXyhuEd75NSxvMU1HVenNOgoG6EwiaZRHccrAw4HnHWZrvH/PPvMg
X-ME-Proxy: <xmx:BR9qaiL5rirQi9ktK6jXZaetTikK_bARABMxNGO-ls-WkfH7-8JlMg>
    <xmx:BR9qalG-3BYD4uyeJjCEnKXi6tZsHo71aFNgNJr4gtkZmQ9b7Ybvhg>
    <xmx:BR9qahtFrs1WsmbtGLs4mtgZUzzn6fpZRKG5y5BqCRr6aU3My9CXVw>
    <xmx:BR9qasuy-0IQ_l5nZb4iIrcAfiH4IdtxJsfV4pAGBWyJCxmxjfIlzw>
    <xmx:BR9qajc3uvR_svrsIBwhh3GW6Z_gdTmNkRf2mbmXHpSAOCkteeQyr6Hu>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 5C06D1820082; Wed, 29 Jul 2026 11:40:53 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-ThreadId: AB9oMyFLfqdZ
Date: Wed, 29 Jul 2026 17:40:32 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Rosen Penev" <rosenp@gmail.com>, sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, "Conor Dooley" <conor+dt@kernel.org>,
 "Rob Herring" <robh@kernel.org>,
 "Florian Fainelli" <florian.fainelli@broadcom.com>
Message-Id: <ba56ee70-9702-4b11-ad04-d63322ab60b4@app.fastmail.com>
In-Reply-To: 
 <CAKxU2N-3zVUM6A-fQnYWud4O7M55Ghc-wnTCG+8DD6_nh2827g@mail.gmail.com>
References: <20260628231156.1254012-1-rosenp@gmail.com>
 <20260628232714.BD9581F000E9@smtp.kernel.org>
 <CAKxU2N-3zVUM6A-fQnYWud4O7M55Ghc-wnTCG+8DD6_nh2827g@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: BCM5301X: drop extra AXI bus ranges that break PCIe
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

I saw this in the fixes pull request, and the descriptions
below don't make much sense to me. I'll hold off on the pull
request until someone can come up with a fix that they
can accurately describe.

On Sat, Jul 4, 2026, at 00:17, Rosen Penev wrote:
> On Sun, Jun 28, 2026 at 4:27=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>>
>> Thank you for your contribution! Sashiko AI review found 1 potential =
issue(s) to consider:
>> - [High] Removing the PCI memory ranges from the parent `axi@18000000=
` bus breaks outbound PCIe memory mapping because the child `pcie` nodes=
 can no longer translate their addresses to CPU physical addresses.

This makes sense to me, but doesn't explain what caused
the observed bug

>> commit 4f061464281d4964ce46dab60d36a09328f14862
>> Author: Rosen Penev <rosenp@gmail.com>
>>
>> ARM: dts: BCM5301X: drop extra AXI bus ranges that break PCIe
>>
>> This commit removes extra AXI bus ranges that overlap with DRAM on
>> BCM5301X/BCM470X SoCs. The intention is to restore the original
>> single-entry mapping and fix PCIe routing issues.

The DRAM ranges on this chip are at 0x00000000 and 0x88000000
and don't overlap with the axi bus ranges at
0x18000000/0x08000000/0x20000000/0x28000000, so the initial
analysis is wrong.

> With need_ob_cfg =3D false (no brcm,pcie-ob in bcm-ns.dtsi),
> iproc_pcie_map_ranges() is never called. The bootloader has already
> configured the PCIe controller's outbound windows correctly. By
> removing the extra AXI bus ranges, of_translate_address() fails, those
> bogus resources are skipped (the OF_BAD_ADDR check at
> drivers/pci/of.c:377), and the kernel stops registering DRAM addresses
> as PCI MMIO windows. The hardware continues working with its
> pre-configured outbound windows.

This sounds like the bootloader configured ranges don't
match the ones in the devicetree description, which would
leave three options:

- change the bootloader to match the dts
- change the dts to match the bootloader
- change the driver to reconfigure the windows according to DT

Can you check how the OB windows are actually configured
by the bootloader on your board?

      Arnd
