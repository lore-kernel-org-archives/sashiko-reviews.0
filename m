Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EA16599A59
	for <sashiko-reviews@lists.linux.dev>; Tue,  8 Sep 2026 18:02:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788890538; cv=none; b=C7PU3y01gQqXSWzgoK6i8XLXHLjlwaCeCcN9HWf2CkrWvku2O2yn8a2+ua33Enq4UsHL9/GO+HseoORWbUaQsx+5EfF8XdhxpBrTfZoVjTZSiRny4z80IlU8iU1OB8z/C8pXNEXxUTCwHxtxmxW/OmFfvj7K6bl7y3oYzKp0qs4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788890538; c=relaxed/simple;
	bh=BDNBy7AIVH/fx56SD5E5ecBJAcyxm/yO0xm5UoXqelA=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=gS+MafV2+HjJn00nmzgORCWvGav8d7nWv4iYlJnwccBEYtR7vPdFZzDHPFwKDmWWuxSx7La3JCFk3IRozgVmdCsgssTiL1KDx8XFIYO2z0eky6oUKaV2GF7ARQmb2RT8pthlME7T7V8cSYQRZwbKF24s1rR4Ob9Vzq0xD+dz+Z4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Nv2Y6zNC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Nv2Y6zNC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C15B01F00A3E;
	Tue,  8 Sep 2026 18:02:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788890537;
	bh=kT0hHosdrbmQwUM2AUizcp7Jzv73P5mSJH7gbHyQcp4=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject;
	b=Nv2Y6zNCS0Njj264cWEYue/Yfci5wzuIojUf4O93UTzDc251QyfNgvZB7cGBLfP9h
	 KkLTUnz/C6fHIbDMJLdribLU5Nkk+yX4KrUXO+GkfiUjiNKs5ZN7OLOqE53+2UT59c
	 K/eVE9Q3xBRB+frlQwv+avbuYLMRLVfRtAQsvKQ/2zK+KKsbT5ow1dd/s9OThChnYq
	 /6yCfbzDxWWzsW+ZGpyryZ2x4jzeHRPuXxfw9J+vQcYlnxS+8s+yj64QfENcl1AkVc
	 WsFbQcjUyVFzdDZpUMM/2Ag3M8ghCKDqg82bQIx1C7V6gt5jPTK5ul86E4eT8oPPMR
	 AOEtQYn/PVKyQ==
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfauth.ams.internal (Postfix) with ESMTP id 35059198003A;
	Tue,  8 Sep 2026 14:02:15 -0400 (EDT)
Received: from ams-imap-03 ([10.64.2.23])
  by ams-compute-02.internal (MEProxy); Tue, 08 Sep 2026 14:02:15 -0400
X-ME-Sender: <xms:pU2garhdU5lBB6zmHM35TwJodTTCqDnFrJfU0SZOsbuzzNEiSN3uFw>
    <xme:pU2gai0L4f_j_vZHkLbEj7cD0ATDhCsuIN7IXTaoAczfVEILgnti3Fzr0KKjKN4LK
    6WBmRXoxbCJOBu5IW4W7WQ4fQwb-0BZroqFJlv-Ceu2QceIsuYEcx0>
X-ME-Proxy-Cause: dmFkZTEQVbJo8jTXVn+5+OwdkBij81Fry+YUOczZJgnIVkmOxw8+fibr1YJr00j7BSAwmg
    l9g8CIJ5MEALSMiAZxgQ+1gsBIuJfyoHtQMLfDfnpd5LLkrWlLI6uWqEtJuy0pTKQwP1hC
    laAbrAkGDWKR2M9EKYkx9XINIhQZL9rYjFlG4gv+7eC4NmYJ+t2GSoxEgCs8jD8PKNX/L4
    N4vqTUb4mTH80baeR3U4Jb52xKxv1pt4OgjZ48zcpodZnTXxeg8KlY1ch/oyFYlNWbqonr
    Uv8gtyy+CBN39O3iasQ+2mojRw2xrPKMWD4jYYGaYkbUl0WFpZ5HO7q8pe5/cGF3zWlCYX
    ayF1zd17H3CESkUoDfub9KXPX3VhAIEe176NqxP7OmbGh67g5fYYbJ+8E99UfOwagPWw1C
    su0GPbhz7GONmAzvCUTtBG0UIoHrfMcOZr8ufaD2+bD/gjkh7w1kK4cPgy8uHRg8eMsbFC
    npIB//+7QqNxHVPREeD1BId38PLgCipIgyRUbfclxinVal0jC+bNn7oW9Fd4HFBqYaOwu9
    6ifTT1BpfV6S7NLJMlKRs+c3SPajhoKOohmUZ2zHpxj57hlxj6MRrKnkFd3w4JxFU2bQgk
    Z5luL7ncYbQuOB38j9skSaOvA5b+ZWRPhaK3jwF0HkLq4HeXR4fWGz5UIIwg
X-ME-Proxy: <xmx:p02gasG8cTTkKuXjg9H3-oh3MoK9KO0j1rCPL9hzUf_267aG8IBicg>
    <xmx:p02gannIvOK4NyCVFLjsc3aq62ML7_4Hb1ziO8v-fOP4LEN5l95Q7w>
    <xmx:p02gaobtTc8dTn-LMzdpt-3lr91NqWAKNTVQkfj0tGop0KicQpeVGA>
    <xmx:p02gakH0ywG7NKw_m5pjSMN-12urQshlkAAuYPfnFkJHnmzmtaa9VQ>
    <xmx:p02gahI66tLp2Ot9h7wX8nS2I07h613v4_iGiQD03MflRu559ph-ZnP2>
Feedback-ID: i36794607:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id C5C2432A007B; Tue,  8 Sep 2026 14:02:13 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-ThreadId: Aq7JKXuBk433
Date: Tue, 08 Sep 2026 20:01:53 +0200
From: "Arnd Bergmann" <arnd@kernel.org>
To: sashiko-reviews@lists.linux.dev
Cc: "Conor Dooley" <conor+dt@kernel.org>, "Rob Herring" <robh@kernel.org>,
 "Frank Li" <Frank.Li@kernel.org>, imx@lists.linux.dev,
 devicetree@vger.kernel.org
Message-Id: <747cdd3b-5224-4bd9-9dc4-4ac828a05921@app.fastmail.com>
In-Reply-To: <20260908160512.0FE271F00A3D@smtp.kernel.org>
References: <20260908152808.3928630-1-arnd@kernel.org>
 <20260908152808.3928630-8-arnd@kernel.org>
 <20260908160512.0FE271F00A3D@smtp.kernel.org>
Subject: Re: [PATCH 07/13] ARM: imx: remove i.MX31 SoC support
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Tue, Sep 8, 2026, at 18:05, sashiko-bot@kernel.org wrote:

>
> [Severity: Medium]
> Can the removal of CONFIG_DEBUG_IMX31_UART leave obsolete preprocessor blocks
> in header files?
>
> In arch/arm/include/debug/imx-uart.h, there is still a check for this
> symbol:
>
> #elif defined(CONFIG_DEBUG_IMX31_UART)
> #define UART_PADDR      IMX_DEBUG_UART_BASE(IMX31)
>
> Could this block now be dead code because the config symbol no longer exists?

Fixed now, I did script the search for unused Kconfig symbols,
but missed the DEBUG_IMX31_UART dependency as that was a later
addition to the series. I'll run those scripts again.

>
> [Severity: Medium]
> Could the removal of SOC_IMX31 orphan the hardware random number generator
> driver?
>
> In drivers/char/hw_random/Kconfig, HW_RANDOM_MXC_RNGA currently has:
>
> config HW_RANDOM_MXC_RNGA
> 	tristate "Freescale i.MX RNGA Random Number Generator"
> 	depends on SOC_IMX31 || COMPILE_TEST
>
> Since SOC_IMX31 is no longer defined, this driver can now only be selected
> via COMPILE_TEST.
>
> Is there also a risk of leaving dead code in the clock driver?
>
> In drivers/clk/imx/Kconfig, CLK_IMX31 has:
>
> config CLK_IMX31
> 	def_bool SOC_IMX31
>
> Could this convert the driver code into uncompilable dead code since
> SOC_IMX31 is removed?

These are all addressed in a later series.

> [Severity: Medium]
> Are there dangling declarations left behind in the subsystem headers?
>
> In arch/arm/mach-imx/common.h, these declarations still exist:
>
> void mx31_map_io(void);
> void imx31_init_early(void);
>
> Could these dead declarations be removed as well?

Fixed now.

       Arnd
