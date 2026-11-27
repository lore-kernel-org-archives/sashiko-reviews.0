Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795794027;
	b=Bh8haidpTzg4jx92cgWYzhz6fF9g+b8DqZbQzwvApyqvNgxQpLwGy4/tviI8JjQgICna
	 koV4Sq5owhg6oDwzF57OSL+wq1usd0wBFbehWj/kxqKrq4M1DZ/Dlt8vnS7TS3I6XnizX
	 U7a2+Xix6O3aaLf8nWeALE2C14/6cmuIFhOV0eM5r8+/1He2Fs7Ind9dhfxvsr0moWeeG
	 Hrzp2Cxim9PdWdr+AQiQjLSGvT07UyujMTAlubEVJC5WHQet9i5HRdTxDZ5YfamFzc5O7
	 KpKy8msjVlnE5vknJOvqTfbFY/hm5IR3W1oa3t5kRcTtCLoxMjZ+rn2auxY3AQ0xfhg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795794027;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To;
	bh=RKs2RVj+9gsb66NQWK1/mc/w12k50POtChKJApRr/mM=;
	b=DCKu3W3alN45A1FFStw9AQ0EgjUR+aPWCIdoNmC2wytRZyRhVvP/Wox3u/DcTi9MvwR3
	 seqDw5XV4b1y0PmHwqwPDv88qg5FtvomplM9X+nv4nLKRHGJAl8ubv9A260IAjyID4fiF
	 mpj+0m2Rk0/G0IzSHkkczJAnuLcT0IsUWGeiVNUlIU/hpChdtrWLSI/jOCJIB4E/0kelI
	 2+LNvNjYjJ3DYAhonlxGHSqbTej1DKmwKLkXN+7zzQnxCzTbE96ym9LMuNOxzlKoRxGca
	 LiEnpMLsENJ96GawRz45PvUXQNtnEHENc0QHXLSrWG1wACJVLQFi6OeEspfb7A+Sf0w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Wmr56y9b;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 006DD606A31E
	for <sashiko-reviews@lists.linux.dev>; Fri, 27 Nov 2026 15:40:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 006DD606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Wmr56y9b
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a5177d78c7so83764645e9.2
        for <sashiko-reviews@lists.linux.dev>; Fri, 27 Nov 2026 07:40:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795794025; x=1796398825; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=RKs2RVj+9gsb66NQWK1/mc/w12k50POtChKJApRr/mM=;
        b=Wmr56y9bq8JClDCRwq+fcHBSWjudEm2jMPPtlOPJBUv3rD2cgmB+P98YjVrA6NzErJ
         dy/LdTHIrxo2fO2scRK/xZX8j9d8BKVlR/MkzUSzX1mRVLttwKBripo3Yv1eh2mnVse+
         qWnsq74+Hah7ippis66+BKblXaZGNqY7TJOozuS8yYK/fc5RHuch1Q8G+kbh+kkLBDQE
         2r/ZYvIC8A13x734mFlMZ1uJTT5YLOsFnVd3s9TQV3ICF9CzYf/hWrmiuheLjCZcWfB7
         mDcjAQGfkt5Eft2o0n8QLrZLXfBxEd32er6qT1xQNsgcSUFoqoxlfJzQyp7Y3mjfAfL2
         FQ6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795794025; x=1796398825;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=RKs2RVj+9gsb66NQWK1/mc/w12k50POtChKJApRr/mM=;
        b=OJ7zvC+3ic6xS5UG07lv8h6uyFgHtdMySTu3PqErS6lRMzxnFbsqHJFMMIlFddYV7u
         3WcTEPuUibD6DgTxYky5h0VwklStycy1AEY+qkdKxD6sP6RDm7pg4RRHNIbdv2EB576W
         qmWUwQbtqDUkNNuknJU+ue3UL3yb059aMjGzAbFKpyNQBLh/GIHRx0OU46vVIv+aV6ZR
         zsCEvMghpStmdzDrBBFa6ANr1HUkjex4P8HNXKZONzYODFDuDJK7wxWuBVVcOqOVrbFt
         IxrHULbV6jQxN46B8Ui9+x3cT81tkuO8mPApOxh/yz/3BVEBEvmG2lhW3N/KuHiKubI3
         92bQ==
X-Gm-Message-State: APuU4Z+BLWh6AQnxrDV/d1il9Zdk3cgD3TSBTbqk722rBnQ6lycr87eM
	QZOitbzYPrbKKrlmgikE5sLIIopuTJwQJ6sjG87VUuLhZBF8EBwfnQBdDmqhde+l5Os=
X-Gm-Gg: AZFdTZf6fv5LGH9MEGpO+e8h0QSSZAkgEO8F0pS7dvP1E336EqCbMRNaKzN0wzCh603
	hvGXoUqC5usHFUfejf/GJuRcY0b5Pmhwwnx14L/AMvvtat5gW9cN036LTAvSvaBJ0JSecTCzewf
	cwnkal8A4noimGXnIiJDi58ONB9binoFoFi1afoCpc88N8RiWcFFg17DGxKtg3zEpvCZ5fFpUl0
	KsnFBD7kBNMLgYx1PlY3hHae+uu9vHutblvWYJOvXwlCGOtGmmJAPG85Wj0+pZrrcUhyRZhKsv1
	LrP98uknoa6bBhpC1ZXptC86N/8cKbKGspPXRLcOSBmE5PDvYe60gf4EuIavptVdRSNKukb9E8f
	VXzFhxQj9KS/2M8rL+KR1ruDkKzhxn0DsqBKnPLE5/BoX2bSnAOs36dd+ANB0YZ8qYnntpvR2XR
	+tYR9/RbgAz9+7szg/1ZPoxxo2ReCqVhCN3GOxdqPjfbHNTDxT10vFDEWU8N+RooS6VXhw4LNe0
	Rrz+x2tJuLNQE3m0I1UBf8hSUYnj+UmQPoFQeaI20QmC3+84pxSJMYKpPdOqlXlpFMvnT81CrTk
	MDoQJq1O1v8N1e/FZoqFhLdTT2xqhuzFqI0LDe9QhWEX4Pd+qgdw6Jzsr2FJC4LhxMfnIhKwimf
	z
X-Received: by 2002:a05:600c:6744:b0:4bb:afae:150d with SMTP id 5b1f17b1804b1-4bbafae24acmr95659035e9.33.1795794025073;
        Fri, 27 Nov 2026 07:40:25 -0800 (PST)
Received: from dom0 (bl20-90-91.dsl.telepac.pt. [2.81.90.91])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6bb989eesm47847939f8f.50.2026.11.27.07.40.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 07:40:24 -0800 (PST)
Date: Fri, 27 Nov 2026 15:40:22 +0000
From: =?utf-8?B?VsOtdG9y?= Hugo Silva <vitorhg20080@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, linux-serial@vger.kernel.org, 
	robh@kernel.org, conor+dt@kernel.org
Subject: Re: [PATCH RFC 12/19] serial: esp32: Rearm TX interrupts when the
 FIFO is full
Message-ID: <awmieG6bM5iKWYzv@dom0>
References: <20261125233020.1380594-1-vitorhg20080@gmail.com>
 <20261125233020.1380594-13-vitorhg20080@gmail.com>
 <sashiko-outbox-236334@kernel.org>
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
In-Reply-To: <sashiko-outbox-236334@kernel.org>

On Thu, Nov 26, 2026 at 11:32:18PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [Medium] serial: esp32: TX IRQ storm in esp32_uart_transmit_buffer()
>   after x_char
> --
> 
> commit dad4b1d831af0fbc408461f76bacc91b367f0e67
> Author: Vítor Hugo Silva <vitorhg20080@gmail.com>
> 
> serial: esp32: Rearm TX interrupts when the FIFO is full
> 
> This commit rearms the TX FIFO empty interrupt in
> esp32_uart_transmit_buffer() whenever data or x_char is waiting to be sent
> even if the TX FIFO is full, and acquires the port lock in
> esp32_uart_txint().
> 
> > diff --git a/drivers/tty/serial/esp32_uart.c b/drivers/tty/serial/esp32_uart.c
> > index 304e1345518bd..002d6fdbd875f 100644
> > --- a/drivers/tty/serial/esp32_uart.c
> > +++ b/drivers/tty/serial/esp32_uart.c
> > @@ -354,14 +354,14 @@ static void esp32_uart_transmit_buffer(struct uart_port *port)
> >  	unsigned int pending;
> >  	u8 ch;
> >  
> > -	if (tx_fifo_used >= ESP32_UART_TX_FIFO_SIZE)
> > -		return;
> > -
> > +	tx_fifo_used = min_t(u32, tx_fifo_used, ESP32_UART_TX_FIFO_SIZE);
> >  	pending = uart_port_tx_limited(port, ch,
> >  				       ESP32_UART_TX_FIFO_SIZE - tx_fifo_used,
> >  				       true, esp32_uart_put_char(port, ch),
> >  				       ({}));
> > -	if (pending) {
> > +
> > +	/* Rearm TX even if the FIFO had no room for queued data. */
> > +	if (port->x_char || (pending && !uart_tx_stopped(port))) {
> >  		u32 int_ena;
> >  
> >  		int_ena = esp32_uart_read(port, UART_INT_ENA_REG);
> 
> [Severity: Medium]
> Can this cause a UART_TXFIFO_EMPTY_INT interrupt storm after a deferred
> port->x_char is sent while TX flow is stopped?

Yes. For v2, I'll use UART_TX_NOSTOP and let
esp32_uart_transmit_buffer() control when the TX IRQ is masked.
After sending x_char while TX is stoppped, driver masks the TX IRQ and
leaves the queued data in place until the TX resumes.

I've tested this and it works with a mocked FIFO and in the hardware
itself, where the serial console stayed normal and responsive during
normal use.

> 
> If uart_send_xchar() runs when the hardware TX FIFO is full,
> uart_tx_stopped(port) is true, and xmit_fifo is non-empty (pending > 0),
> uart_port_tx_limited() runs with count == 0 and leaves port->x_char set, so
> this check enables UART_TXFIFO_EMPTY_INT.
> 
> When the FIFO drains below the empty threshold, esp32_uart_txint() calls
> uart_port_tx_limited(), which transmits port->x_char, clears port->x_char
> to 0, and breaks out of its loop because uart_tx_stopped(port) is true.
> Because pending > 0, __uart_port_tx() does not call port->ops->stop_tx():
> 
> include/linux/serial_core.h:__uart_port_tx() {
>     ...
> 	pending = kfifo_len(&__tport->xmit_fifo);
> 	if (pending < WAKEUP_CHARS) {
> 		uart_write_wakeup(__port);
> 
> 		if (!((flags) & UART_TX_NOSTOP) && pending == 0)
> 			__port->ops->stop_tx(__port);
> 	}
>     ...
> }
> 
> Back in esp32_uart_transmit_buffer(), port->x_char is now 0 and
> uart_tx_stopped(port) is true, so nothing disables UART_TXFIFO_EMPTY_INT.
> Once that x_char shifts out, UART_TXFIFO_EMPTY_INT fires continuously in a
> hardirq storm until TX flow resumes or the port is shut down.  Adding an
> else branch that calls esp32_uart_stop_tx(port) would ensure the interrupt
> is disabled.
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20261125233020.1380594-1-vitorhg20080@gmail.com?part=12

Thanks,
Vítor
