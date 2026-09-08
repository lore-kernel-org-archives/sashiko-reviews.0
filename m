Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B380658124F
	for <sashiko-reviews@lists.linux.dev>; Tue,  8 Sep 2026 16:41:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788885685; cv=none; b=bfFqdF98UTPRf/UFzU+HPTH5buqHKgBKJTqTzrbevZoXk/nBqcjWOMot6lS5PEavOyylTbSiAP5YOj3VRh3iHeImC+T0ZRZnT30OPZjZAIAy+0hpOXnSJF2VasCtz1RiyU7aURUo+Re8uG267nNQt5BVpmoEVZXI67c2fMLZ1/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788885685; c=relaxed/simple;
	bh=imXzlO5bq0RM+PwWkkFq8vD3Gd7NK/6QDTFvY5ab1JM=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=k3agbajPDo6TwNMjIqFB8ZZ66igTkw7BFA3fpnna6aW5zy7w4a/n0JSXDdeYqlaAMJy8RoC6TSWwXstiXb/aysf0CGOKTGuUOy/nGqcJmJXTQJHkP0uhS32PWBF7OcRuanFsYRy4h/rRYCFUMz/mTWhHPBVSDxuAJ1b4mzzOhPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iFf0j0VI; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iFf0j0VI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 120DE1F00A3E
	for <sashiko-reviews@lists.linux.dev>; Tue,  8 Sep 2026 16:41:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788885683;
	bh=ZyPWpmzPstexQ1dmRuOQsA23+Fy3xgJk2feDmpCd/g8=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject;
	b=iFf0j0VIK/R4FnHyPNS1JwQ8bo/alKmW0GfhibxKScb2zSkmWt4gCdr9qTbGY2wB4
	 eS2Pef269GbbLfdxYmyLYrlLjY+5tosw4tbpX0FlIfbuX8C8Nn0cegQJeDUbB0q1pV
	 GnZYtdeJB3TGc+fkUEfU+SkwPzEJX+8jgb0/AWT1AeVt9byc0hWN2EldaK/sfilJE7
	 X5rijFbo2Nr5bwDJZ+SBA2z2gAo48exBBJyrndDW9rclCisIVLDAarPpxsp4EIdvnX
	 /QJ9FWTp202GzPvt/pDj5UWrRK/SMXNzA1PPhNFju0X3vEJypJCwcE9F1yxzsF/iGc
	 RqMODbylBrCvA==
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfauth.ams.internal (Postfix) with ESMTP id 4D7C5198003A;
	Tue,  8 Sep 2026 12:41:21 -0400 (EDT)
Received: from ams-imap-03 ([10.64.2.23])
  by ams-compute-02.internal (MEProxy); Tue, 08 Sep 2026 12:41:21 -0400
X-ME-Sender: <xms:rzqgalOn3JFLDu-k1VeMxaA6QwM7ww4VoLf7L3fCTm9L7_xpxxEB1A>
    <xme:rzqgaiykWm9C_xXjA9mRoChAJkbR36L9Z7Gd2idN6JtjPI7tqq2YfLumBRzsCRl9y
    Le5WvlyX5JEp_zK9evoP24c2ewE3qtvw0HAxASK9V1tQRLUD7r5L0I>
X-ME-Proxy-Cause: dmFkZTFHCt55lUKzQHggVLdX4ZIreF/N0oIQzznAd2sSVLkmO/pGBLuy/9Kx+aWfzW4gDP
    tgiVCbGrXt3MLU2wFZyBmdeftFOi61k/m/epowP2+3kthvTdRhiCr9ndrbfiHlENPYCMD9
    6iHazJJBD4LPMds0sjMYWPyL60kBfXG5tejLU1ipD0lwUMjvb0B+6+3n7gFcEntIbM3o5s
    fc+3pQ6uKYXyG1j/lGe1M13rcOVafhB7paNY5w4e4BJYu9IOZc4QIL99AgNA+H2vsREi0C
    kzVHCPmDA6XpBFNmvEH+4SVLFkZXVuxH1nIa8TY91VGH4Uku17hKf8Oj4JYAadLPU9Ftf7
    cyoZNfdBKTWL2iaF1HrgZ4cd71YAlhy87wvB2gx5peZsGjQRMgH2Z/9tuB9D7D5OFV/mvS
    5nilACR4DZQFWgS7k/ZrwD4YrKzgCPY78Kk3v3Xc5aSnp3gvtYRw3D5MkwIiO0ZxzMY8B2
    N3YMv6axz+93WAiKZSusaFwmc1uibtmVUlCqfo2tFAfqw+fGRdPnyTS7wEgWMG42O+wFug
    yeRw37K/fjADK6AUTganPNr9PSe6cNAqNgE/r/AYfv6r8ZZrYj+pO6YsHuucbbvJjL9P6b
    f5b3Icc18a3ODtatmy3Mspngnavp5VcdK0eXKBlTSq0JCFpC72Oh5+WBmOTA
X-ME-Proxy: <xmx:sTqgaux0xjEj8IHcf-PTW6k-BLjy4LJyAYxjTaAG21creCr6rfoifw>
    <xmx:sTqgasjU6e7ucKPyuGOsZ-bxZvYmVdAoKjiMYs75nkNSxIEPdzMMQQ>
    <xmx:sTqgaiklX1IMYFZOtAk3G006QRD6qyQw9RjoGIwwsLJTtXyGH-drYw>
    <xmx:sTqgaqgWYezbxn8vM6NLUZjCGbezgRNN7eY1lQPbrl0F3E8HMnIAPw>
    <xmx:sTqgau1pRrokThHgXiKUuqj012Gogl37MmhukhC9cp0wZP_bSfe980sH>
Feedback-ID: i36794607:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id 2031E32A0078; Tue,  8 Sep 2026 12:41:19 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-ThreadId: Ab0V4S-ixU_F
Date: Tue, 08 Sep 2026 18:40:58 +0200
From: "Arnd Bergmann" <arnd@kernel.org>
To: sashiko-reviews@lists.linux.dev
Cc: "Rob Herring" <robh@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "Frank Li" <Frank.Li@kernel.org>, devicetree@vger.kernel.org,
 imx@lists.linux.dev
Message-Id: <f03314d1-3276-46a3-8c09-61422fab7d3a@app.fastmail.com>
In-Reply-To: <20260908155505.7992F1F00A3A@smtp.kernel.org>
References: <20260908152808.3928630-1-arnd@kernel.org>
 <20260908152808.3928630-13-arnd@kernel.org>
 <20260908155505.7992F1F00A3A@smtp.kernel.org>
Subject: Re: [PATCH 12/13] ARM: at91: remove samv7 support
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Tue, Sep 8, 2026, at 17:55, sashiko-bot@kernel.org wrote:
> [Severity: Low]
> Since this removes the usages of SAME70Q21_CIDR_MATCH and the other SAMV7/SAME7
> macros from the socs[] array, should the corresponding macro definitions also be
> removed from drivers/soc/atmel/soc.h? They appear to be dead code after this
> change.

I removed this as well now.

     Arnd
