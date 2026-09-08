Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E363F566C6B;
	Tue,  8 Sep 2026 15:44:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788882253; cv=none; b=TOpDLg8lEHdm/5Am2HdvZgd0mJHArHumJx862e9OBsSp2lr3UFNq0KGuvQz53VsnlhF5fvFsof80z8BPlmlHTw6lKdvIhoC/AlkNr5ziTUtnte0d8JdrPv+8fxgrXlqNlBpuM1CGwV7Drkb0lBUs131VdRk1SMBPpyLaRMvcyH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788882253; c=relaxed/simple;
	bh=2sQYPUneuR4ZSGdqqd+SKprCLhKCeZzvWBfwWxdHdEM=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=oAWNXWcahplbJsYh4Nh6ysMOJQNiHwdHQCkCG9g5WIAHbjiXh5iyPvKkaGY6i0JETaYoRatGLHKXprRnALRCAwvo4xlFSYGkLuDuuqhS1/I64sUfxIeLFZY4B2uy+9ZE/GCSR0zz7DKii1IOjyiLG21zpHcU+ijb1jN5rJdVvB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=N3Gcxs+0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="N3Gcxs+0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0AFD71F00A3E;
	Tue,  8 Sep 2026 15:44:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788882251;
	bh=EH2dChw65kaslKrabSI9Djzf8MkU3Xd2BmnnvykGLqM=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject;
	b=N3Gcxs+0bJAq0Ihq8r7WhhCn2jBeX+aX0L1hDYXWmNaFWfqmDgeSWNg7//yWtf6X+
	 Sj7WrmHUeFKcF2jvA69IxFYC6o3d45rLrCOfR7Ze6Wb6DEZw+lQ3dnd0KgJJXw5hls
	 yiNfIc7CrmP+avcWH0cX+KNpKuujDLbDYKaqCPs5v5q8uCWweKHxm6b+ZXxQmTlN+S
	 KjfzS8+NLTmW6vxdbDQLx7LCVHwmZ+oOvRxBQme5jdRu8a8x/S+mngzjvWtU1DhWgq
	 WOEH1nmIPPxsKH3LCRhNQffUETfNRZFTyI3tTWPPwwoQWqQt5Z+AwHis3RmtG9+4Lw
	 iF1mc8U15sfKQ==
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfauth.ams.internal (Postfix) with ESMTP id 51418198003A;
	Tue,  8 Sep 2026 11:44:09 -0400 (EDT)
Received: from ams-imap-03 ([10.64.2.23])
  by ams-compute-02.internal (MEProxy); Tue, 08 Sep 2026 11:44:09 -0400
X-ME-Sender: <xms:SC2gamkss_ouqXEa-vSA9FUhSBboLWfTKdpadCtTczkBUEA4HvTjQQ>
    <xme:SC2gaooSi5IOeSCPUB71Ultes_t_8McR_RJh2NgDt-RkZ7oNh_1n0UECWoFLiTA8z
    C0KRDMdpHARGFoNil351kOPzxUvEC6rt6cOnSBt18j3dYx1W3o1JAA>
X-ME-Proxy-Cause: dmFkZTE0RZDaTg8c/EBPxiTonhblRlyk2bP9nouGlMGbrlUQKto1iwX7/dfuiYEQqg0yJV
    F9AZ6dXnaKuqIql4CIrJeYPNPZS+8kbfeMomSveBdTyPsvURQG0vZ8UjIPu0L/bx87qVKa
    bmU5AgWFwEZWpn4pL87JtQlRly1N27IM//wHFq50vuZ6xuzPeQPkYMtxscGGKtluRUkyFh
    39Fgd+Kb6FN9zQSKkWa1kdw+AezXiwZ+i7lEDyQVnY725gJVWD/3ggrQTudvVlES4kf4ll
    na3puvFslEPeJcjbnDaT4YL2LqLtZ72gy3UNH3N7m1es2qnTfbXGHZ270OFaAv0EmFw3jL
    kIbrgnZvxpKeEHIPntlJb7b1Ssu9Vzl9LAlz+l5uMHJgUM1lYIt1gsNqCB84FE77BNV7e0
    JXclDlhiUvE7pxmdZJD5iw9VLqJAsNixRBP/XHT2r1n2u/WZZc50wwWZvLlCNf5aHtwjyV
    vWG9orcL0y4zRsWkrzAxbN+dZLO0tOTRVHq83wHZPgVfZhQxVLzLnZR02rhkrZwpKkUw2Y
    mbw5JQaiuJSEtSQz3eqak3L/WXP3JQfrOl709z2HQ/NW5/pKHbysgMBPvo0cuqTCHNmg0+
    dRCfD5eYP6kg9qSSEG+faYRw1lPaFtZISLACDCt1Be3kaWA+AsPiiGy9++fw
X-ME-Proxy: <xmx:SS2gaiKhasqJUqUwoqM90w3_2o86Cuvtx6DzSxtqNx9bJGR5aMtnJQ>
    <xmx:SS2gasYrUQLLR7OOTGpjA3fbiD5JsYwaSrxnwvV-7JvbaMhxcK_ZOw>
    <xmx:SS2gak9jr-OjAXwshU-vYMRAweM7Qt-jGEXya5EHGZssuz87R-Vw3A>
    <xmx:SS2gatawaSLc3bnncxYneQ3RsVTPcUHCv-sNAQNljEx3xTNKF6Nu3w>
    <xmx:SS2gaoNj3Xz-KsoDHhGUlaNgBotU2y3j8BDZ7uBx89rurVZv03WXgdaq>
Feedback-ID: i36794607:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id EEE7632A0078; Tue,  8 Sep 2026 11:44:07 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-ThreadId: ApQdFduAKTi-
Date: Tue, 08 Sep 2026 17:43:47 +0200
From: "Arnd Bergmann" <arnd@kernel.org>
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev,
 "Rob Herring" <robh@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "Frank Li" <Frank.Li@kernel.org>
Message-Id: <0233a06f-ff79-4721-8eac-03953815f4cc@app.fastmail.com>
In-Reply-To: <20260908154154.50FDB1F00A3A@smtp.kernel.org>
References: <20260908152808.3928630-1-arnd@kernel.org>
 <20260908152808.3928630-10-arnd@kernel.org>
 <20260908154154.50FDB1F00A3A@smtp.kernel.org>
Subject: Re: [PATCH 09/13] ARM: lpc18xx: remove entire platform
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Tue, Sep 8, 2026, at 17:41, sashiko-bot@kernel.org wrote:
> [Severity: Medium]
> Does this removal leave several driver Kconfig entries and Makefiles with
> unmet dependencies?
>

See cover letter: I have the patches, but am staging this out
into multiple series.

   Arnd
