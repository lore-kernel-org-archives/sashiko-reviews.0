Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E94A36D9FE
	for <sashiko-reviews@lists.linux.dev>; Mon, 12 Oct 2026 07:24:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791789888; cv=none; b=exsF9JbCGuIio9E2U5e/Fz7Ov6pGgMRVFZ8I8AX2umElGO64QLT7DPB9i2MmQ//YkwqGOUfYNaxauVMBoYisW2dS2r3bySOSw2bwb++xPh60pZXPpOhU+H4St9+VZWq6nU7Dn7wANL51pb9P5zOWGZX2Fk3xDSunT8x+TsPw/aE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791789888; c=relaxed/simple;
	bh=jV17N1XnG5N3su2j27UvWD50Emp1boXs8D7A8+3TlcU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=NDLIBk6LOu4c8XEG0mphIW/zfaOTwd65R6E3rUPOV10rdzl7Ge56Ccb/eM3rSFB1fqWJqwJHTN1FtaFmmxudhblzxU1UjZ07SZOCT34K9t5GtlIL64cY4Q2YaxI2EPEpBdP9LH2wlYOd/pLJ+QhI11CpL2wp3tt8oVCOIHxRTtE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dSXb4HUv; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dSXb4HUv"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a171b677d2so8618795e9.0
        for <sashiko-reviews@lists.linux.dev>; Mon, 12 Oct 2026 00:24:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791789886; x=1792394686; darn=lists.linux.dev;
        h=content-type:mime-version:content-transfer-encoding:message-id:date
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CV4XRNqthVu3jHiDgMNv0zc2zrlUjFwHtxZxyGCKLaE=;
        b=dSXb4HUvBhfvKL3vzZr8bPGMSXAO7RIzVX74tX2smPJsWT9+ncb6dZeXtUsMrQFVhK
         gz1d8TBA1CkkY4aVAN/B6RgGmsO0BDEoFzJHtFiT3UFMKV+VkGyMPS+QnhGs4aVv+Sv1
         Fn8ova4w0yAn+wag2mVAkGN2b+EYfOGDQtHt6KSaPe9ENTFV1n11OANnBXmYjXCEoSFX
         TAoW1x3i32BmZBjPievIhqYJ4iJWP0HC7p7E3wRtbO2Guf4ahen4mqm3SLQftCOL/m88
         jOgq8ApBHpLjHn5g37UExdPVvTtPM6n0hmtuUKmvjzT7GGTOfduoq6IeHFgQYbw5vuMU
         dlTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791789886; x=1792394686;
        h=content-type:mime-version:content-transfer-encoding:message-id:date
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CV4XRNqthVu3jHiDgMNv0zc2zrlUjFwHtxZxyGCKLaE=;
        b=mprr850Jyyw35bmnZ0HCy2IeGfMUwTrc5w7K/57pz9Wsc517iqNBmX8H7fUFAq679F
         pWQLtBqxqaOvxhqHhUJihxphG21NQW3isLAl8HyLdf+THcc1DHyKdKvBLKRe/9SytJSu
         1TFH9Sg4Fz2h0M0Z8ynj/6WEA61JIT/+mdij+HJ1To0N1XwcCzVL13MZvJ7vL0L1erBB
         lW8Ur7eN3RCMb3hEpX5N5hXev9Y58h6H+Z1xyvWsqZErnx9QfBvZ/lfpqZKoGDxXjomn
         iOuO6eGntfAbAWUIzIBT31JnlZYkvGu58ZHHvi/70tFwLiwZ/4WOI4HhYbBaqOrdQNB8
         5K2A==
X-Gm-Message-State: AFq9FYLRehsj7TIyrrREpBof7/Uy4VAJYcJBHdOISzTXyFj7pLDPWRru
	C3gdcTYgqCrLUzoJ325NCEBpQvbfj9Ya3rCAjK2E+4dpu9VOs1NkwBPP
X-Gm-Gg: AYBFou3lPGV5yZ/t0CvFDySnPgEk7nt1Fs3ROaeJyFOKeUanZmuhXbLbG3S3CGWG6m5
	OA/XeebHRXNLWbFsctW6nXE2hl+kT0pIePFhUztuVZE7dCOuQLgji7LClDdJoXL2OAp1gr0GDt1
	5GJ1t9AHbkN2oH9WNq8dj+psQL7Q9AcfM0UR0U6rMTaLOOLqBqguqhoswZ4eeJNEUbYmfWkUl+F
	L6l0whAb1UqgcG7Jpea7o5J9hN6O0AgnzGbJZpaej2k4wWeGhi8+WXuLz7OkePx7rAmkBUv73o1
	H+SCJNWPTDynxtoiKgp3d+a6TqELgC6MDy4rjo1dRa7eSZbllPzizoVi24biRh7+7Q0WYDDJ5Zn
	+dQQK/Jmv1ejkOJ3PUNyb5WklS+3M+TgsTCcakeO1DjKpR+OSb1GrwGgfU54xKhgyt4Zy9JboFI
	t45NggdEMnlUoEWuPwlD7SP7MokwtYsKDnip15KXmEATynR2TzaSlBwLi7ndLFabvKmlEVO4ePw
	Zl5duN5Sm/Qfak2WLhp+FX2nIpakRDAi2p2Iw5+/lqFzlcHAKiKsEK+myzyN3kG2fc=
X-Received: by 2002:a05:600c:4ecc:b0:49c:fa21:e749 with SMTP id 5b1f17b1804b1-4a18e4d55f2mr191008715e9.31.1791789885437;
        Mon, 12 Oct 2026 00:24:45 -0700 (PDT)
Received: from [127.0.1.1] (ip-024-215.users.dtel.ru. [91.210.24.215])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18e48db03sm380276065e9.3.2026.10.12.00.24.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 00:24:44 -0700 (PDT)
From: Fil Dunsky <filipp.dunsky@gmail.com>
To: Jiri Slaby <jirislaby@kernel.org>
Cc: sashiko-reviews@lists.linux.dev, linux-serial@vger.kernel.org,
 robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
Subject: Re: [PATCH RFC v3 07/10] tty: serial: Add Cortina UART driver
In-Reply-To: <b48bdddf-2218-4164-8a76-e9cfa2802111@kernel.org>
References: <20261012-b4-cs75xx-v3-0-0e0d17a098cf@gmail.com>
 <20261012-b4-cs75xx-v3-7-0e0d17a098cf@gmail.com>
 <sashiko-outbox-167778@kernel.org>
 <b48bdddf-2218-4164-8a76-e9cfa2802111@kernel.org>
Date: Mon, 12 Oct 2026 10:24:34 +0300
Message-ID: <179178987463.76422.8459872081179927553@gmail.com>
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format="fixed"

On 12. 10. 26, 9:13, Jiri Slaby wrote:
> On 12. 10. 26, 9:10, sashiko-bot@kernel.org wrote:
>>> +static void cortina_uart_set_termios(struct uart_port *port,
>>> +				     struct ktermios *termios,
>>> +				     const struct ktermios *old)
>>> +{
>> [ ... ]
>>> +	uart_port_lock_irqsave(port, &flags);
>
> Seeing this, why not to use guard()?

No good reason. v4 uses guard()/scoped_guard() for the port lock in
startup, shutdown and set_termios, the sysrq-aware
guard(uart_port_lock_check_sysrq_irqsave) in the interrupt handler, and
guard(mutex) for the port table in probe and remove. console_write()
keeps the explicit lock/trylock pair for the oops case.

v4 also addresses the RX points sashiko raised in this mail: the driver
now sets read_status_mask/ignore_status_mask from INPCK/IGNPAR, reports
parity and framing errors as TTY_PARITY/TTY_FRAME, and inserts the
overrun marker after the characters drained from the FIFO. The hardware
latches these errors only in the interrupt status register (RXDAT has
just the data and a valid bit), so the error is charged to the first
character read in that interrupt.

Thanks,
Fil

