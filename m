Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AEC7218845
	for <sashiko-reviews@lists.linux.dev>; Thu, 18 Jun 2026 04:30:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781757048; cv=none; b=tpofJS4h8IYxqqnfYk4p7Dp/xUAgrTKNmp+s3Y0sxwKbxoEWPukdpZQXGzz4VMtJTXaq9bHQCKU6CglN4huxnH6FMH7M0Jjgactl/FbKSwfKWx/xUKTp/uzr50qaQy1H3mw9Ll02JMXxmL8qM+hzlNlIXaw1XBKzoKgQlwrcaKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781757048; c=relaxed/simple;
	bh=64jtikOdxNCRpd47E4DI1fsgJu6X9T4CDAofBwQE/Yk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bx5JoOPpc1GU9oWYXgQMoTUwuI9JJAuwSqM6oFEDOPYQ+cy2pXApKWFNOnPjr+jRBLiFxkgZTZZqDVhz/wKD2T0kDRpc2dPueKQroWcayDYYYSCIzT+vWMbwKDaYWsGMCAHev+XU3La4qac/VdTH7D7AebsHL07PTFKCW2tb3+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q1kkdcjl; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q1kkdcjl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C84DD1F000E9;
	Thu, 18 Jun 2026 04:30:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781757046;
	bh=DHmk96uiHkviuL9OahPCLRPAmLH8lVTAdu6jHOhQphw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=Q1kkdcjlo9bdHWXagAB9lsoyDUExbM5jfkCl1p6WD4WxpvI5HNJwm0AYV3CWeyENk
	 atdTDNOKXzZiWTVdfE+kDGasnAxHgZGYW5q7UhptfvqJrabvVnl+ztOQ8BNYXQwdh0
	 gmv6XPtTiJuuuOAn+qJl/POQuxYtDc9brFeF3PckEBr8W+fBF9+XHn+1QuvOclY7+W
	 d9L39vM0UkcxDFYSx0VRvd1/k7HWTCNTAJG0lbq6GKBr3s9RJNlq2bsyXpiOiMjeMC
	 YOrtcMzaY9LRahpe9UjWuvtotawQN+qy6elkX3rvWjmWwxqQX74AnQYu1VHfp868Vg
	 q3dGiWveZlvYg==
Message-ID: <85144ed7-50b3-42cd-8405-f64335a94486@kernel.org>
Date: Thu, 18 Jun 2026 07:30:43 +0300
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 16/16] i3c: renesas: Add runtime PM support
To: sashiko-reviews@lists.linux.dev
Cc: linux-i3c@lists.infradead.org, Frank.Li@kernel.org
References: <20260612160458.3102106-17-claudiu.beznea@kernel.org>
 <20260612163403.B8A091F000E9@smtp.kernel.org>
Content-Language: en-US
From: Claudiu Beznea <claudiu.beznea@kernel.org>
In-Reply-To: <20260612163403.B8A091F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 6/12/26 19:34, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> 
> New issues:
> - [High] Timeout handler fails to abort hardware transfers because it clears the BCTL_ABT bit instead of setting it.
> 
> Pre-existing issues:
> - [High] Transfer loops do not break on timeout and unconditionally return success, leading to silent failures, race conditions, and memory corruption.
> --
> 
> commit d8976043a71981cb4634aa1e9eafca1113e44ec6
> Author: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> 
> i3c: renesas: Add runtime PM support
> 
> This commit adds runtime PM support to the Renesas I3C driver, guarding
> subsystem operations with pm_runtime APIs. It also drops explicit clock
> handling, modifies wait_xfer to return unsigned long, and introduces a
> function to clear pending IRQs on transfer aborts.
> 
>> diff --git a/drivers/i3c/master/renesas-i3c.c b/drivers/i3c/master/renesas-i3c.c
>> --- a/drivers/i3c/master/renesas-i3c.c
>> +++ b/drivers/i3c/master/renesas-i3c.c
> 
> [ ... ]
> 
>> @@ -443,7 +442,24 @@ static void renesas_i3c_enqueue_xfer(struct renesas_i3c *i3c, struct renesas_i3c
>>   	}
>>   }
>>   
>> -static void renesas_i3c_wait_xfer(struct renesas_i3c *i3c, struct renesas_i3c_xfer *xfer)
>> +static void renesas_i3c_irqs_mask_and_clear(struct renesas_i3c *i3c)
>> +{
>> +	guard(spinlock_irqsave)(&i3c->xferqueue.lock);
>> +
>> +	/* Disable all the interrupts */
>> +	renesas_writel(i3c->regs, BIE, 0);
>> +	renesas_writel(i3c->regs, NTIE, 0);
>> +
>> +	/* Clear normal transfer status flags. */
>> +	renesas_clear_bit(i3c->regs, NTST, NTST_TDBEF0 | NTST_RDBFF0 | NTST_RSPQFF |
>> +					   NTST_TEF | NTST_TABTF);
>> +	/* Clear bus status flags. */
>> +	renesas_clear_bit(i3c->regs, BST, BST_NACKDF | BST_TENDF | BST_SPCNDDF);
>> +	/* Clear error flags. */
>> +	renesas_clear_bit(i3c->regs, BCTL, BCTL_ABT);
>> +}
> 
> [Severity: High]
> Does this actually abort the hardware transfer? The commit message mentions
> disabling interrupts and clearing pending IRQ status bits when a completion
> timeout occurs.
> 
> However, clearing the BCTL_ABT bit is usually how an abort is acknowledged.
> To actually initiate a hardware abort, the host typically must set the
> BCTL_ABT bit, or explicitly reset the controller.
> 
> By only clearing an already-zero bit, does the controller remain in a busy
> or hung state, potentially corrupting subsequent transfers?

The ABT bit of BCTL has the following meaning according to documentation:

  ABT
0: I3C is running.
1: I3C has aborted a transfer.

And the following explanation:

When set to 1, this bit allows I3C to relinquish control of the I3C Bus before 
completing the currently issued transfer.
In response to an ABORT request, I3C issues the STOP condition on the I3C Bus 
after the complete data byte is transferred or received.

The Driver shall clear the ABT bit to allow operation on the Bus.

Thus, the drive is clearing this bit to allow next I3C transfers to go on.

Thank you,
Claudiu
