Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 072905803A4;
	Tue,  8 Sep 2026 15:54:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788882887; cv=none; b=mP1e9TIWTUCCPQurzCV6fAMI8VYYJUucjY6aAJfQMQCc3dJ7/3wxNsaGj/hfr71FTE+ezcCw/9zf7XQEkCZPzl9J17SsCJJ9C1kciunQsnjpQaTtsaUD48EpeFS12ngRTk0gQYrG85TSw3Cs3i1nvgcdhKV6enUINoLGDemR/KQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788882887; c=relaxed/simple;
	bh=vJLLBfkaN4n0z7LfLM0SdkDcnADIq78u4hb+z3cSCvs=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=E2zrWgkDZ58u5jv7ZZeHbhYokOTKL7cngBhIpvZU5nO4gvds4ZXFfSzH87HIzzEXX0Kp0+9t+NmJ0LQ4ycO9OqqkV3vQ2Eszy4Ew4NHDqSPa/bHqUpFpEcZGsNe8CC9Q8XFx11aI8vd56ojuvE09cQqShtxriqJxSYEi2sdCx/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mZmHWOMJ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mZmHWOMJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CAC331F00A3E;
	Tue,  8 Sep 2026 15:54:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788882885;
	bh=yRJdV9GVxWUYV9yCpWvEhBDguuUlSfuEeEuU4CaxoZ4=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject;
	b=mZmHWOMJriTMhh79lfF6vevN5fYL+hyZ5SmAO+HRxHmDuit/QMZfZm1eky9VaWhpO
	 EY8PfZs7F6JTliu7YDNeGL7uL6Fo3nNDrQwjrXYBEPDLRWyXaVnj+ihLIHhrf7//ic
	 MbmMioZtN3usiS1yD51p+BwHYCZYZQ7+pee+q5YQbJQn0SrG7Uoz3Ps6QBRQKzOAXv
	 9E7yVYSmfOyTJoPo0jH/dZg0twpFUM8BPfDLxnVpPbm8y8p9XUDhZsG0BMW1urCEp/
	 sF4F4Cc1cSitK9b78P+or+8H0LbIjlZl4fFOYwwv6BKzX0raXmdBf/NkRRmK+X+5wk
	 x9uarNvZUHhXw==
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfauth.ams.internal (Postfix) with ESMTP id 308AF198003A;
	Tue,  8 Sep 2026 11:54:43 -0400 (EDT)
Received: from ams-imap-03 ([10.64.2.23])
  by ams-compute-02.internal (MEProxy); Tue, 08 Sep 2026 11:54:43 -0400
X-ME-Sender: <xms:wS-gajNhMGM3Gxzcef-yXdGene2vzQIJIJCQsMbUucZg0ESkSia7ew>
    <xme:wS-gaowIgGPrv4h32oHDZXsUYBzPo0dZzRKFqJcyScwWTAbh6y1ncqGdX0Dv4nlzP
    7ljYN5QqELhRvEIf6VDdxmSAoQA4tmZ4jgobBKRyMXX9a1r83UIo7Qo>
X-ME-Proxy-Cause: dmFkZTGLwLZViC9sd85t/P9neK5mQH2VP8dHwnJbVAzTMRboBc9GY3Y0SufdB0PabDu0Bw
    etX//xWANhEWe+XH12gf0SVEuw/OxEtX4HEnkpJ2rHojRxBWwsQIfNpyPzv7uBN+lSKv5/
    SqiouBbLssFGgSzJUBbsFNUp6wNdJz2qBToqFbpHCAoGYosRPqyJBSMsHHzbikA99KMoJN
    liA0KaarEy1JNDfft14Z8BYFZIaVtTSiLGElG0zXYaXrUyfWlxzh2ILUNIu9U3WIUTlIHC
    ccb7Z+RwpoaVMTAahwIuzfRyusxsV7yqkohJmElcj0EterN2DarbMY4Gu2AhvdwWGHSUSF
    +QqGOmoEymLbEZ6M8sQd83uUOXo7c7Txg4K89ukNWAElSHrOj586Q4FZ6+hfCt73bCXAOY
    1xdw78eGIF/CdsscaDLf8AFeXiqjERP3Fq6Gnkt38qDdT2MonVMajVbcD6YqBhSTey9oTZ
    tIs3Ehn+cMdTxQosFIAxv7Oclq7Epb0ae6DTYo1CGZhmQWIxeXVc5LmxrkgzQqnm1x3O5j
    FwHN3beBUmEnTRjBFh93yn4JsIbaq7lgNJqAd+PrKfSHerCbz0fd0LOoPZlRMEQsuKEoj4
    YgdzeCEwX5GSgW7Wz+xbRJTdRDur0fqHFkCISHeqOVXQRi2ylcw8S4/wsPtw
X-ME-Proxy: <xmx:wy-gasx4ChskjzrEKIJ6om9udRtN3q00ZZk5Hs8QWVvY4dP4cA83zQ>
    <xmx:wy-gaii72i4Fgq-O1aO7O54W_yWEQhxvgJbw3ivrMy7xdwfyTg7RGA>
    <xmx:wy-gagl8a5u2zS0xIaHUUfe5LxJRRNInPL7dzMuXbcLxnfBAs79iBw>
    <xmx:wy-gaghUL3NmZb5NcX7WSJZsyfxf55U3J0f83-ErG9dzlcfF81L28A>
    <xmx:wy-gas3Luj_0c3PVbuzJEEcAoqgxlhY-jbl5gKU0DhqGlBpftxsVaUXN>
Feedback-ID: i36794607:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id C855E32A0078; Tue,  8 Sep 2026 11:54:41 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-ThreadId: AaAMVJPR8SoN
Date: Tue, 08 Sep 2026 17:54:21 +0200
From: "Arnd Bergmann" <arnd@kernel.org>
To: sashiko-reviews@lists.linux.dev
Cc: "Conor Dooley" <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 imx@lists.linux.dev, "Frank Li" <Frank.Li@kernel.org>,
 "Rob Herring" <robh@kernel.org>
Message-Id: <04fd3dc4-6aee-42ba-b41c-df7acb89239e@app.fastmail.com>
In-Reply-To: <20260908154346.CDA0D1F00A3A@smtp.kernel.org>
References: <20260908152808.3928630-1-arnd@kernel.org>
 <20260908152808.3928630-11-arnd@kernel.org>
 <20260908154346.CDA0D1F00A3A@smtp.kernel.org>
Subject: Re: [PATCH 10/13] ARM: stm32: remove stm32f4/f7/h7 MCU support
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Tue, Sep 8, 2026, at 17:43, sashiko-bot@kernel.org wrote:
>> -The STMicroelectronics STM32 family of Cortex-A microprocessors (MPUs) and
>> -Cortex-M microcontrollers (MCUs) are supported by the 'STM32' platform of
>> -ARM Linux.
>> +The STMicroelectronics STM32 family of Cortex-A microprocessors (MPUs) is
>> +supported by the 'STM32' platform of ARM Linux, support for the Cortex-M
>> +based MCUs is has been removed.
>
> [Severity: Low]
> Is there a grammatical typo here? Should it be "has been removed" instead of
> "is has been removed"?

Fixed.

> [Severity: Medium]
> This is a pre-existing issue, but does removing this selection of STM32_EXTI
> permanently disable the irq-stm32-exti.c driver?
>
> Looking at drivers/irqchip/Kconfig on line 485, STM32_EXTI is defined as an
> invisible boolean config symbol. Without being selected here, the driver will
> never be built. Could the corresponding driver and Kconfig entry be removed as
> well?

As with the other platform removal in this series, I already
have patches for these as well, see
https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git/log/?h=board-remove-7.3

       Arnd
