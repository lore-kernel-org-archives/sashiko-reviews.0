Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793722586;
	b=E41TZGHAVbFQfCls7gb1IgEkNrcy9ZjQuCpufWAAtXBeBUshq+tGCCVxQYoVPHCc0Blz
	 IJqPLCt46m0BBs3F/v62tNG2pfbJ64SNe6eWUNS741Ve26SYpsQUZO82u2Y9/jIXLyFaC
	 nTYMDmK7KQ5LxX9ed0UFITPh/XQ+CZFTxc63ZPCaBUb24p79PcV/mnRy/zgymNSTBc7Zi
	 tQJLcoHSsq9Hw6yKq3yeKSfUXm55ttjMyKu+Yy1YidG73v2nf+BRS/NuTLWoDxSQrSpvT
	 H2GYKmnmGRQh81Rn8e4IWNYz0lHFl3eBSTj3uNfQYJYBS/wuEpCrQeI5OyKe6Ey1g8w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793722586;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To;
	bh=a5wryUwdVr5GvbYUG9GqKAxvh5aLU+Gi2pGInFj178M=;
	b=Y7jh6Fnfw54kdCXl88caOktZh8koASGD9DuCzs6rEO7ncFYp13PbqdUo0QxNKEdXhKa5
	 ihFg86JG/f3bBeueF6hs4gVXMHhyv6x43FR/duZzZxX/Y8+sIsf1dN3NqloGkNZT1e4Uk
	 x4iLe74Uz3lstoKEKEwdipq6MZendrL3pJtIyR7V/onwYx1LABmzsW7sueCLNscSTXqjJ
	 7VzL/X05EGEFHtrSKSvxk+pN/X3bsvBE/tcfXaRJmSBQTI3gcWDu5zp1dBrjG2dbgWgc3
	 jcVa9lM0VzmKweESf/rB4pJZYAilU4QDNlDXSR2ADiYeNyDQTTmFqwebrjQ4q2m1Vjw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="tBsoHn/R";
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0C62606A334
	for <sashiko-reviews@lists.linux.dev>; Tue,  3 Nov 2026 16:16:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B0C62606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tBsoHn/R
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a2167bd087so37331705e9.3
        for <sashiko-reviews@lists.linux.dev>; Tue, 03 Nov 2026 08:16:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793722584; x=1794327384; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=a5wryUwdVr5GvbYUG9GqKAxvh5aLU+Gi2pGInFj178M=;
        b=tBsoHn/RKoW/lIatKfPWnQm9bWwWNZiz4iXJf48ef8C6uhWma6BWWSI0qKz9QcK3Nt
         oxxpxpBNPU0oUb3+tvysK0T5HgKO/JhIRelThyhh9dAyuivLdtYCGGPzFXgEWKJDL/S+
         9Bn2Agz8Ubu8cFUhUSeAfe3fZHFR5sRruS1mjoI7GEPm//cZnVAetwhbOYedZgPyH7+N
         3FjYbXXskjbuJYV6iLxVls+0bwYv0XwDS/91GtIhUE+sPclqmgr5LV6ECwnmklhvUdCF
         saq7cQ3okS7yxv6qpAep4AUlre6BtTz2GFG1k4NHgooGeDdMGdRUZPNud4RmhP6LoHFZ
         0eZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793722584; x=1794327384;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=a5wryUwdVr5GvbYUG9GqKAxvh5aLU+Gi2pGInFj178M=;
        b=Wha8P/mfxwCIvDz3kwuocOdSA10tvgHLWvtM1rfZubaPV2gvuIIFuaSCTCQeUmRpMj
         UxYKl25xzrPmE/icI2mpsRqqBC2XZvGbOvo8ejUOexcZShV3tSHeF4xZkGuVZ+tL/VoR
         Pd7ZI93dZBMrqpJ5cLGAVAxZxDerRjhvR84MQ5pXGJr0Vn9ur4GmZqi+TwuOHvpZEXrq
         OmqHnjelaGTTNJWroFOxdua7kY5WPx5J8HfTPaGBCM4OJTQemzv6q/UDlvOcbIo0mIIn
         evDPP9VpxmkNEE5EZuPNv77WWJS8pdJcDIW4g5XLqmNPnoTbo5chHNynJ0L5wQ1oDEHj
         Yadg==
X-Gm-Message-State: APuU4Z9wtSBnkjZc3T73YyO84eqDN5x/ZrKE4yy0JPY787rBf0hZvQZ5
	C/ttqQ8pGzzCS9Un3gdQmQCqeGqoKUoDFwNk/wteVATsVvTwZT2I4D9Bv7dsWA==
X-Gm-Gg: AYBFou0KFjqn/QHgfQvA+9hGRxZmwThYuRM8PJTvmzyZ0BwPiT+ZjncRnnf8WZ0GYcO
	8129A0t9/3Rf6QhbICeJMc3Jalw0qPdZdADUF5mhzlNZznCqwf6jbHE4EoHvuX8fBw8UmMMB+Ek
	Wqu9TltsAyjwIyE2TnPitxwbEggh/f39neIERgDqNYyJ2hRURYeNTUK9m89D2JsFK7ah6rhP4U4
	+Wa9JPU+Q/Ni0UHoVbQ1gBoq4o6C7R8ot3qZxMFAZ11AtKjoi19hoq4L9kz+Le8b6CljvkAUN14
	ZOf4/yWn0f433fx2DW+hLY1oi01YswoIw/R4iiHkQzaeP2weU/vrzwwQxJKRz6CSbtteyr4GJ5P
	OSdeLmwvUW4xIiJLgbI8PWYMNrQ4fqnHmrp5eIkW2hUWvd+0CHY527/U83GiuC6xZa0JvuGtTwN
	iKIsg/WL/ja0rPZFvwEqn5P8squvs9D3VhmLEvelXhWmnSOYgyZ1jUTDqF0CG/rHETUDoZfB48V
	HyRZvox/Zqg3p22troEqJUkf2mENIaL3o0KwnxMS+MQD7zYHnn5yyeQ15Az87qx1SKve1CErNyf
	jT07dBiUWwCyVvP3uCyWXH4RtjiZBHu4KGmocgbTrZBrFWIxkmJK8VSMIY68wVUJnuJWkY8BBAb
	VFaTPDc593qJkdebe7pCUg85+cNYV+HGzkmBhmJgVKz0vLxF9I/F6SOhzCYNnxA1oW++/JKUQAa
	VxPtmy
X-Received: by 2002:a05:600c:4454:b0:4a5:1cf1:b7bd with SMTP id 5b1f17b1804b1-4ac1794032cmr319005485e9.16.1793722583910;
        Tue, 03 Nov 2026 08:16:23 -0800 (PST)
Received: from Lord-Beerus.station ([93.66.71.207])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71bab1a8sm25631726f8f.57.2026.11.03.08.16.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 08:16:23 -0800 (PST)
Date: Tue, 3 Nov 2026 17:16:20 +0100
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, linux-serial@vger.kernel.org,
	robh@kernel.org, conor+dt@kernel.org
Subject: Re: [PATCH v1 3/3] serial: fsl_lpuart: Enable TTY wakeup for
 wakeup-source ports
Message-ID: <auoI1NJgc3ky89jf@Lord-Beerus.station>
References: <cover.1793719239.git.stefano.r@variscite.com>
 <58d65b44ca054ea83eb835bf5decebd688cad04d.1793719239.git.stefano.r@variscite.com>
 <sashiko-outbox-195698@kernel.org>
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <sashiko-outbox-195698@kernel.org>

On Tue, Nov 03, 2026 at 04:07:25PM +0000, sashiko-bot@kernel.org wrote:
> [Severity: High]
> Does enabling tty_wakeup_default at registration time cause a suspend and
> resume state mismatch between the serial core and lpuart_uport_is_active()
> when the TTY device is not open in userspace?
> 
> With tty_wakeup_default set, serial_core_add_one_port() enables wakeup on
> tty_dev during probe before any process opens the port (when port->tty is
> NULL and tty_port_initialized(port) is false).
> 
> If the system suspends while the port is closed, lpuart_suspend() calls
> uart_suspend_port(), which checks device_may_wakeup(tty_dev) without checking
> tty_port_initialized(port):
> 
> drivers/tty/serial/serial_core.c:uart_suspend_port() {
> 	...
> 	tty_dev = tty_port_find_device(port);
> 	if (tty_dev && device_may_wakeup(tty_dev)) {
> 		enable_irq_wake(uport->irq);
> 		put_device(tty_dev);
> 		return 0;
> 	}
> 	put_device(tty_dev);
> 	...
> }
> 
> Because uart_suspend_port() returns early here, it leaves uport->suspended as
> 0 and skips console_suspend(uport->cons) as well as uart_change_pm(state,
> UART_PM_STATE_OFF).
> 
> However, lpuart_suspend() then checks lpuart_uport_is_active(sport), which
> requires both a non-NULL port->tty and tty_port_initialized(port):
> 
> drivers/tty/serial/fsl_lpuart.c:lpuart_uport_is_active() {
> 	...
> 	tty = tty_port_tty_get(port);
> 	if (tty) {
> 		tty_dev = tty->dev;
> 		may_wake = tty_dev && device_may_wakeup(tty_dev);
> 		tty_kref_put(tty);
> 	}
> 
> 	if ((tty_port_initialized(port) && may_wake) ||
> 	    (!console_suspend_enabled && uart_console(&sport->port)))
> 		return true;
> 
> 	return false;
> }
> 
> When the port is not open in userspace and console_suspend_enabled is true,
> lpuart_uport_is_active(sport) returns false, causing lpuart_suspend() to take
> the else-if branch and disable ipg_clk and baud_clk while the console is
> still active and unsuspended:
> 
> drivers/tty/serial/fsl_lpuart.c:lpuart_suspend() {
> 	...
> 	} else if (pm_runtime_active(sport->port.dev)) {
> 		lpuart_disable_clks(sport);
> 		pm_runtime_disable(sport->port.dev);
> 		pm_runtime_set_suspended(sport->port.dev);
> 	}
> }
> 
> Wouldn't any printk() during suspend or early resume then call
> lpuart32_console_write() or lpuart_console_write() while the LPUART clocks
> are disabled, triggering an unclocked MMIO access (bus hang or synchronous
> external abort)?
> 
> Similarly, on resume, lpuart_resume() skips lpuart32_hw_setup(),
> lpuart_hw_setup(), and lpuart_console_fixup() because
> lpuart_uport_is_active(sport) is false, while uart_resume_port() also returns
> early without restoring console termios or calling console_resume() because
> !uport->suspended && device_may_wakeup(tty_dev) is true:
> 
> drivers/tty/serial/serial_core.c:uart_resume_port() {
> 	...
> 	if (!uport->suspended && device_may_wakeup(tty_dev)) {
> 		if (irqd_is_wakeup_set(irq_get_irq_data((uport->irq))))
> 			disable_irq_wake(uport->irq);
> 		put_device(tty_dev);
> 		return 0;
> 	}
> 	...
> }
> 
> If the LPUART loses power during deep sleep while the console TTY is closed,
> doesn't this leave the console hardware uninitialized after resume?
> 

The suspend/resume mismatch described here predates this series and is
already reachable by enabling the TTY device's power/wakeup attribute
from userspace with the port closed.
This series changes the initial wakeup policy, it does not introduce the
mismatch.
The underlying suspend/resume handling should be discussed and
addressed separately, rather than attributed to this patch.

> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/cover.1793719239.git.stefano.r@variscite.com?part=3
