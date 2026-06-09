Received: from fhigh-b3-smtp.messagingengine.com (fhigh-b3-smtp.messagingengine.com [202.12.124.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BECB35E931;
	Tue,  9 Jun 2026 17:24:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.154
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781025864; cv=none; b=nVeGTwocN4wFB27x6gaUWioL/Qjb2eaMi2eA7t5S2wJ5zEzkhohcOiwQ+RamS5tHmE4WAqD7kIWDF7nhs1stt7SeAQ47vsCWibJ5SD3yf1EuCpgKRhOJac757EWJRW8FQaJTayjFa+UHGlZtS4h7tG1rm7uRklilh7pItmFuYOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781025864; c=relaxed/simple;
	bh=kRGHtIIbXaW6G5FcEhsfnfAHMwheKr2lKX3/O6neinE=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=VoKBCkPbgPvMt2i4pZcKZZxUTqTeZfkfkepjW9rICAZ9WUbhCse3fjWsXHupDKF/i1HlDbvUk91XOshRE26hi0jc2ZlJkOr+fjSycyS/NMYzlmnmZ6ozBNi5ZsATwAmMNjKxRECWrN/RnUl5mE4UGfp+QX1YVHE+GeLTNYA3ANo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=NbWB6qhK; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=CK7Duo0Y; arc=none smtp.client-ip=202.12.124.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="NbWB6qhK";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="CK7Duo0Y"
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 716397A013A;
	Tue,  9 Jun 2026 13:24:22 -0400 (EDT)
Received: from phl-imap-05 ([10.202.2.95])
  by phl-compute-04.internal (MEProxy); Tue, 09 Jun 2026 13:24:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1781025862;
	 x=1781112262; bh=RO7+Oyis/nP8Powp7AVcbTGDY2whvYZik0jR7od+ohI=; b=
	NbWB6qhK/h7hjuUcdHtei7VOakiS4XhRGmMy1QVW61IeBbFfUY7qpFcseo5zZxzW
	OUQpiV+X8p5Ru1OCUpf0IbOBw+cz4FHuy98doKoBDENKFoonjsmEyZWuM8SG6AZG
	aaeVZgCunPI5ZsTRtRuzrJ4vG8VV3WbmfesmMA4Z6jhmYJlHGmbBYyMJZq2jGp5x
	1sSjVhkUVbh4WP23PRQ17eHbB2CBLdqABue2v3ZmDtjOuN8q/icBV9MGQaKUv/rn
	Umk2RVobDQ2YB7rHUzvy1vnjYS/WjnICGQ7M6m9aTV8jmo+Uqly4mE1AVWvc+08n
	JsbBSqAyMmtZYtCk+YZ0TQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1781025862; x=
	1781112262; bh=RO7+Oyis/nP8Powp7AVcbTGDY2whvYZik0jR7od+ohI=; b=C
	K7Duo0YlGpnX4P6XQ0I0M+EpYJuVtwnxWfJUnOlDGiQzoE+Yk9P9AGFAKtpw8nQj
	kz/NC6kjU38ZY6H7saN2/0InUyCw0lDpMfkn80Yl7pRmsj4BxLloQ0KWRiXLuGvp
	sPF1yaN+foStkYVY1hd7Rxu6JycgHvV98kusZ4ecFjOreSaqEEG1oWX6Jf+H+dg6
	0FsoYvHz4Jd+roAzU1ehj+9FIP6bvJJDFaHI5eOOpUtcuI10vO34b6YYNXrzyTb8
	NqOMIUJFeyofYjhOTxRgpgx4zE/9sJ4aNcsvjxTsfsqgzWSstarfklxSbYt1xO5k
	7MS3gBwIhwvXNlCmboe0Q==
X-ME-Sender: <xms:RUwoasaPxt-pZeLlsgEx1sivjVc6N5eGavawkSwLVonu88J4YlxouQ>
    <xme:RUwoaiPvzcaEojNe7FDEicoSTqzO1HB60DHJ9fYc-ftjOHGESI8W719BtO8G3TPtc
    Eazs4sRlj1fviZOxbRTp2Lg9vE_teeHSe3HTUuvbi-ljicAlXNt9vK0>
X-ME-Proxy-Cause: dmFkZTE791gYLoRdg1ZFtnJY3TTQ0X27Kk6WYEWXtb3FVj/dE33pBDxRAOhn6SDw7mEVwS
    ejbi091g+lx2fLmx6LlX4GQdYjUfhVCAG+i0q5gCrB5UwjlNu+8OlKkfn+B+tZiKTKK8x8
    RQTt08hhFIg+cEdOBWAkOi9k55469QXIa+fa/hzt0ww8doGPq80bnZ5GOk9ahEmqpyfcI2
    0KA9Wx4a4t3vTkPGfhbl1mB77hwmjKkbh3m3nQ2IhT9Tj0cy6DZYs0jjY+u/zSSpAaoFQI
    A47kMoL/LRrEPqU9KNGvCW1/f9D6qf3G2bbcFyNeyFqYxg7nD+Hvo6lXIXTxXS6mx9FzIO
    X2XALBE6WOnPRqlZ20PqheW35Pmh9QwcFeV0ML1pDslJP86DJfIxrtsPZ369hwY7ilhh4b
    BJORiLooCWtxffOhy0NwBEHEruP1cLK7BRfISyvA+YMmnAHu0bPZxKbWOQYOimOgHH3Jpu
    XAya5zwXA86EGxUPLKlU9fIjOuyHl9GehBlhFmqRX3cFIN7YBCYDelgUe9KBA6NqgV7KMI
    uSL/W8MbHXJNzgC92O0kuJQ/j9IEKX/Op0qNqjkFWCEg2qIj4vio5RstQwcyVLMd2wf41v
    X4JXiUMEG9WZJ6L4gMfgIQJGQS91IsjXazRgstNCyC5TPbzGrUzvcTD9grmA
X-ME-Proxy: <xmx:RUwoatc1jG3rIXZ16YOhEQ3unI5JrJ9pCnfRRXpvC9kXD07Xxt6VBA>
    <xmx:RUwoaqQRrz_DNJ07yeStrWPjrs12bYbsumzhi2xyycVr5cvBhEmjIQ>
    <xmx:RUwoasuYIHZL3CtDnJMlHcobEkVVybxpfOJFPjscqdReuHmX4O0RyQ>
    <xmx:RUwoajeONO929q5L1dVU6_vsQa_4wDe8oWLkN3z9WtJXNBOQgJr4qQ>
    <xmx:RkwoamTG9W4YtXsE7aAB-XCgO9OSnU0NgxGLefuBpPcEHzCv5Jgwchfg>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id D383F1820082; Tue,  9 Jun 2026 13:24:21 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-ThreadId: AdNNzaliM6k3
Date: Tue, 09 Jun 2026 19:24:01 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Josua Mayer" <josua@solid-run.com>,
 "sashiko-reviews@lists.linux.dev" <sashiko-reviews@lists.linux.dev>
Cc: "Conor Dooley" <conor+dt@kernel.org>, "Rob Herring" <robh@kernel.org>,
 "Frank Li" <Frank.Li@kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "imx@lists.linux.dev" <imx@lists.linux.dev>
Message-Id: <9e6326f6-dad1-4169-a63c-e62ee5b341f2@app.fastmail.com>
In-Reply-To: <3528dc91-1ffc-42f9-94ea-a27c6c1d6a50@solid-run.com>
References: <20260524-lx2160-pci-v7-1-09370c23b952@solid-run.com>
 <20260524151347.BD92A1F000E9@smtp.kernel.org>
 <3528dc91-1ffc-42f9-94ea-a27c6c1d6a50@solid-run.com>
Subject: Re: [PATCH v7 1/9] arm64: dts: lx2160a-rev2: extend 32-bit, and add 64-bit pci
 regions
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Sun, May 24, 2026, at 19:12, Josua Mayer wrote:
> Am 24.05.26 um 17:13 schrieb sashiko-bot@kernel.org:

>>> -	ranges = <0x81000000 0x0 0x00000000 0x80 0x00010000 0x0 0x00010000
>>> -		  0x82000000 0x0 0x40000000 0x80 0x40000000 0x0 0x40000000>;
>>> +	ranges = <0x81000000 0x00 0x00000000 0x80 0x00010000 0x00 0x00010000>, /* 16-Bit IO Window */
>>> +		 <0x82000000 0x00 0x40000000 0x80 0x40000000 0x00 0xc0000000>, /* 32-Bit - non-prefetchable */
>>> +		 <0xC3000000 0x84 0x00000000 0x84 0x00000000 0x04 0x00000000>; /* 64-Bit - prefetchable - 16GB */
>> [Severity: High]
>> Does expanding the 32-bit PCI outbound window to 3GB (0xc0000000) cause it to
>> overlap with inbound system memory?
>>
>> System memory starts at physical address 0x80000000. Since there isn't a
>> dma-ranges property mapping inbound DMA to a different bus address, system
>> memory uses a 1:1 mapping, meaning inbound DMA targets 0x80000000 and above.
>>
>> If a PCIe device requests a large 32-bit BAR, the kernel might allocate it
>> within this 0x40000000-0xffffffff range. This causes the Root Port's
>> downstream bridge Memory Limit register to be programmed to a value >=
>> 0x80000000.
>>
>> A Root Port won't forward upstream memory transactions if the address falls
>> within its programmed downstream window, as it assumes it is peer-to-peer
>> traffic.
>>
>> Could this intercept endpoint DMA targeting system memory in the overlapped
>> range and cause system hangs?
> This configuration was tested with NVMe and GPUs,
> the SMMU should ensure isolation pci bus addresses do not overlap with
> physical ram base address.

I noticed the same thing while reading through the pull request
for 7.2, and I think the bot message is correct here. The SMMU
does not help here because addresses on the same bus are routed
inside of the PCIe host bridge rather than directed to the host
side. If the non-prefetchable ranges ever get assigned to an
address 0x80000000, this definitely breaks.

You will not hit this in most tests, because large MMIO windows
are likely to be 64-bit capable and will end up in the
prefetchable range and addresses are usually assigned from
the lowest address. You can try to force the bug by starting the
non-prefetchable window just below the start of RAM for testing,
which will assign some of the devices to the RAM area.

        Arnd
