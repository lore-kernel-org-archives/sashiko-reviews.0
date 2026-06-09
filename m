Received: from fout-b1-smtp.messagingengine.com (fout-b1-smtp.messagingengine.com [202.12.124.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5FF6352C3C;
	Tue,  9 Jun 2026 19:36:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.144
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781033811; cv=none; b=OJEERlsP37rbgQHW1nnfV0RmMBxQb3vXzVWJA2d20FQxKMRs7B2E2ZmxXDSLFAT/vRWlWNkEUEsWbtOfQRYe9bMzaqCZU5IiCAKjKQ47oanjr0P460ntDQVtVZ5BJEm68ER540iZI5gj7vYd3m+zoSxYaCU2C+OI64wPilIltjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781033811; c=relaxed/simple;
	bh=zFZII69Eq2prIZegSL8lHN/AbHGFlMpWwGM3nvgDLA4=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=dCkT9vS4IF9mMp6bFmdrWyStBBY3K3DDPPdi5r4gPLZuSrrUebQI7qY+K/VT8JmMt9vFxrnt8F2xsXAENGAA5FFSSrv3LzZEjSaHsXqCLn3C2UR40zN+q7Hkat6tBGevBewTuT2UjUXVoUnfRcKig+sxXzm9wquLp59DycG5d4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=IKGs9H//; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=SdZel8UK; arc=none smtp.client-ip=202.12.124.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="IKGs9H//";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="SdZel8UK"
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.stl.internal (Postfix) with ESMTP id DFBF81D000E5;
	Tue,  9 Jun 2026 15:36:48 -0400 (EDT)
Received: from phl-imap-05 ([10.202.2.95])
  by phl-compute-04.internal (MEProxy); Tue, 09 Jun 2026 15:36:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1781033808;
	 x=1781120208; bh=dRIB5MXKcGJPe1YfyLPI7erRS4l2n6FfDbqcCvQYxQI=; b=
	IKGs9H//jLOV06siFLpxnoKcb4U0AZ6ESwghF39UMgqThoIijrpTT2ygFScijNwo
	pAvFF3STbhT9W0omnhHVWELPhp+a5qnQm/Wl6QkPpVJ2KQel6JpgYYt/GApdDCtK
	khw1LhVZTKN+ZmEeqKTWCkUEnjnSd64DFDmnmqwPS6tVXeoq/5TjDowF5UJx6t8f
	CY4xE023o0wg3MdB5jRgV8xj2nuRG5kAFSHUmKP+bbzGd8Pdip9BhrKZuIRf7Yw5
	CeHqH07FfrVa2+zmtJyi6yW22cStg45R/nFUt4anqZYlGIZDMr5/0TA8r+D6n79w
	kH6TNYBtXfmVLXS3w+LhEA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1781033808; x=
	1781120208; bh=dRIB5MXKcGJPe1YfyLPI7erRS4l2n6FfDbqcCvQYxQI=; b=S
	dZel8UKF/YG+eex9z+wB2htjg/3AJ7olnhvPM2RvmuPKuPKBfIiCZ/SsbYS/1UIG
	36yh91tyvjxGJsFUWmIZT+ppuKXpUhneWTCW4zelIunMY/syRpSArFoN+ZCjHJXE
	wHTeo5yiN1XSXVRusxFttNoqTB432hd1VZgjthNKl8+/CaRy64I+jYk2yV5jbaRo
	m9r9VpEMztrQ8ytJTHTtWVSMoUcSFAXRJQg4xgy791WiPG1+Am+we6xgSkngrugv
	xTNkxQDXBmqr7/8TmEfH46+un9YTM1OxeYzprC1fhUlcIOEtYBM/W4EgkomRDKEq
	NdEa46eTElkAOKWW1+URg==
X-ME-Sender: <xms:UGsoan0UEQUfbogsyTY6d1BPPTKIw_EiWJmN4VrZJrEgA735XDwo-Q>
    <xme:UGsoag7beKUHcItbtsTayuHthEuWYGvmGPgMglaaYm4iDSDmguVyMi6AfwwLk7NhQ
    q3uW81BbPiUrC8luZrnDLDpdhRohy-gVWpYkZ0ygT8C19hB-UBu_C4>
X-ME-Proxy-Cause: dmFkZTEgh9xNDHP6fqOx9jgSWS2R7jMhtYEp9f/kld5p8Rbhqk5lyvbGRl+gVKqBKjZCj0
    GxaMZ/1HtSk3rCzpND5IyhTjLtQpsfjY5AbAdDIsG9jDZd41guLkN27u7CaRXKjvEDnFdy
    Ss9vV4i6bn2I06uayLVg3MHkVCkt+15dWnDvl9ileE9+MvdXc1VGcSyc+BdtVLmzAjMWqS
    ePhUw264K8v9Zs9PmWsEtDxFfi4Dcvu167vuu1i/K1u6Yx5qsMcWcG7j/WGC7FkceDnxYK
    J6mhuHdrD2edukYJWts8I9EH/1Fqi6fDwnFs8QRYvd5yggNUSPmYExXVS597/B9jdsyER5
    y5g0HxPc3iK7NDeivgJ5jIVrWzX344B43G+cl1TGTZM5If3n5s6+mMuxeoMtFqRJYd1ibi
    RJdDpdMtr2LQAxNtSBJnMolf0kt+doDU/K/PSPzWxisnmq2rjd6JhzSJIyERuYzxKQiSrU
    uSdG5wgYi0BRDF7T/j+QmRYTmIxaW9V7yn7k0hHyOMrlUegsV930iW5G6pBXIi02xER9HZ
    pFo71I2+EjBmFNR0LUW1RDvXxxsnGR+h5ruOWNYWH00J8yNgYfN+LC6/kThJtyt9FK3myQ
    3rbCNrYh/OAM0it7AMU+olZ/agpkFEcHyLwQeO3L/b6gcMIHw5adCi/hUqpQ
X-ME-Proxy: <xmx:UGsoaqQ6NXp_JHynDGJ3M21UVvXCNkw5M3EMkgmEWLX2cN4hABrobA>
    <xmx:UGsoaksFFjC8nLBJLXAki-sRAVDxGy3Q_dwL-sx2ZsuEKvgwVB6p6g>
    <xmx:UGsoasHSxa76xEndlPuUnu8orUbmAPeVdcyIm07cO_6s4zda4DJn7A>
    <xmx:UGsoalzYId-aP8SW701Zt6N-BkTBYB3ML_Q47GVyHNqxxUzKABIV2g>
    <xmx:UGsoakAK-6rg0USdrVGlGsJIzi8KiAitqoU1pyO4UzL5HSGfZ-2655je>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 71B67182007E; Tue,  9 Jun 2026 15:36:48 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-ThreadId: AdNNzaliM6k3
Date: Tue, 09 Jun 2026 21:36:18 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Frank Li" <frank.li@oss.nxp.com>, "Josua Mayer" <josua@solid-run.com>,
 "sashiko-reviews@lists.linux.dev" <sashiko-reviews@lists.linux.dev>
Cc: "Conor Dooley" <conor+dt@kernel.org>, "Rob Herring" <robh@kernel.org>,
 "Frank Li" <Frank.Li@kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "imx@lists.linux.dev" <imx@lists.linux.dev>
Message-Id: <72087d5c-c6f9-4452-b4bd-a9f086700e62@app.fastmail.com>
In-Reply-To: <023aa47c-6fbc-486f-b5c7-5145ddf8e8fe@oss.nxp.com>
References: <20260524-lx2160-pci-v7-1-09370c23b952@solid-run.com>
 <20260524151347.BD92A1F000E9@smtp.kernel.org>
 <3528dc91-1ffc-42f9-94ea-a27c6c1d6a50@solid-run.com>
 <9e6326f6-dad1-4169-a63c-e62ee5b341f2@app.fastmail.com>
 <023aa47c-6fbc-486f-b5c7-5145ddf8e8fe@oss.nxp.com>
Subject: Re: [PATCH v7 1/9] arm64: dts: lx2160a-rev2: extend 32-bit, and add 64-bit pci
 regions
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Tue, Jun 9, 2026, at 20:01, Frank Li wrote:
> On 6/9/2026 12:24 PM, Arnd Bergmann wrote:
>> [You don't often get email from arnd@arndb.de. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
>>>>> -   ranges = <0x81000000 0x0 0x00000000 0x80 0x00010000 0x0 0x00010000
>>>>> -             0x82000000 0x0 0x40000000 0x80 0x40000000 0x0 0x40000000>;
>>>>> +   ranges = <0x81000000 0x00 0x00000000 0x80 0x00010000 0x00 0x00010000>, /* 16-Bit IO Window */
>>>>> +            <0x82000000 0x00 0x40000000 0x80 0x40000000 0x00 0xc0000000>, /* 32-Bit - non-prefetchable */
>>>>> +            <0xC3000000 0x84 0x00000000 0x84 0x00000000 0x04 0x00000000>; /* 64-Bit - prefetchable - 16GB */
>>>>
>>>> If a PCIe device requests a large 32-bit BAR, the kernel might allocate it
>>>> within this 0x40000000-0xffffffff range. This causes the Root Port's
>>>> downstream bridge Memory Limit register to be programmed to a value >=
>>>> 0x80000000.
>>>>
>> 
>> I noticed the same thing while reading through the pull request
>> for 7.2, and I think the bot message is correct here. The SMMU
>> does not help here because addresses on the same bus are routed
>> inside of the PCIe host bridge rather than directed to the host
>> side. If the non-prefetchable ranges ever get assigned to an
>> address 0x80000000, this definitely breaks.
>
> The address and size is 64bit,
> 	0x80_40000000..0x80_FFFFFFFF for 32bit non-non-prefetchable
>          0x84_00000000..0x87_FFFFFFFF for 64bit prefetchable memory
>
> AI Bot wrong think it is 32bit address and size.

No, this is about the bus address, not the CPU address, and this
is given as '0x82000000 0x00 0x40000000' above. non-prefetchable
addresses on PCI are by definition 32-bit, so the middle cell
is zero.

On the CPU side, this is mapped to physical '0x80 0x40000000',
which does not overlap with CPUs view of RAM, but the
bus view of 0x40000000-0xffffffff does overlap with the
DMA address for the lower 2GB of RAM at 0x80000000-0xffffffff.

     Arnd
