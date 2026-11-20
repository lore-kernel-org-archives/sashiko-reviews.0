Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795151707;
	b=zjjw5QKJ/UJMH4lUCvV0BgsmqpT1PBm/xNIPjfMVwExqnv2eYwISmw7Id8s2U3bamAMJ
	 EVcqCjKMB79P04zdqaDHUme3pFTtfOzUrzrhZBH1Z9tlp4hczbHhOvB2sewBG6D+JX3wH
	 HYeU9C+jX1vNwbDhqPxP/fdWUnPKi6VnTqeKp/92H0X1VztJ330FKCZ+DqC4PZfqhc8XG
	 eSCsQxGQ295TwpOWDp4NQbTXxd9gEJp2CZa25MEWXx7Gwx6HBe56wUoCoHRkCWRjnBgAA
	 0cnXdrhqVYPfV1gE3LEg2U6tZVELQ6LcDHZkXuIxzw0dgVOqQZaaniwqgs6AQZc2gpg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795151707;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gmail-Original-Message-ID:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type;
	bh=1EFx4BBUnJL74M9wJJG1K5+Mkfotjm/Vr8HWMsecgf4=;
	b=Ylc6ChkhrC3P/dk8hsxUroYAyE13UQGOVwnOl4bSzX9pbY+8po9kX10ceyviEDbZy7iP
	 XW4ltbQuICfE1zG35R79PnGMrTXYMV6FGiZkJkQbecwxh5B76tYKHvF+Y46fwfUZR79Ns
	 dSsbc5ASSjXqJAhRGwiuBOc6JHKAV500JcTLaAcS209V2dH6G6vwM7a4HGLA7PGlJfrJX
	 3Yzw213tDI82B9xMm3IzNBULBwti1X/Lq7ciF3P36rGnM0oueB7jRm5mYcp42UxvCegJA
	 MYCRNQu7asw2+y3q5U6G8a/m3SFz0gWpRyPlxKtvM7LUNdPzQTLRd1eocC391yHOLRg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=telaak.dev;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.214.182
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73304606A335
	for <sashiko-reviews@lists.linux.dev>; Fri, 20 Nov 2026 05:15:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 73304606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=telaak.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2f046b0adc0so792845ad.1
        for <sashiko-reviews@lists.linux.dev>; Thu, 19 Nov 2026 21:15:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795151707; x=1795756507;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=1EFx4BBUnJL74M9wJJG1K5+Mkfotjm/Vr8HWMsecgf4=;
        b=dXFMi0Mje8PHkUYRBRBw0NvJY11ElMQm4mixBKakJWGRumafGhqpTIsy1GegFSFQvW
         rU8NzCo8exHOjcr/frC8GOo3F3BP4pFVhD7w4bJ8ratpCMvTejOpuAVd2R5at4rxsGtU
         jlwKJ/QmP86B+BwY48iRr77g0LmSJ08wmWl+pwTYOCOsC9cvUX70+BSvR7mxS2T2Th+l
         SP309c2RrENfXzbNt9IVdlK9DzPkS70VXbGE02x1soB+oZljX4sOUwc7cModYf/9QIBQ
         WNnJVTBZpzhuBVj0LLQA4LleTETlMcvLNCtePPIdEwmeTAmhscE4MVPAkV9KQSO8+sE2
         FALQ==
X-Gm-Message-State: APuU4Z9iZiiTPBB2klT9LO/q1EQ8nbxGfqAaOgXTBPynm+gEfYsiW5W/
	vBqFsbMbF38dIhq310hbtjiq77q0E8mdamhMJ92kJujUv2lvZb6mRSJLXC6pbVUZ
X-Gm-Gg: AZFdTZc8pTaXhpHkOLSBdkmocngb6Zkkdj77rE/LnEW9gU25Xc9vSHD0H4RckAgaW9X
	okzhWvIjlVNpRU5aQ/goOt7qAnZG/Gjgz9+tsThoawNDQlv5np+eQWRadfmepV7dklj6sWYSflk
	o2EjefH2SW2gLESRIw/sxCaIqk5Am2m2rCRPqOhg1nn8VkkHEXZ+L9uiksdqBXH9G2OZ1f7ZOBJ
	VTdYdjenf/3qID0ZxKn2gEjeefiPqxz36UijdxwaTHKIjGpgVBHCbQkpt9htrBi0cjLbR/+/zV2
	AexXGQ3euwlIl1OoDhYkuCqJB7NN+rmlxwcr7befY3tKYERoHG/VJCuMu9bShP6+94b9fzEH6X5
	naLVoXweBS9Dq9Z3C59iceMRZ+5l9la47HbxoaucgFZrcjDv2c2Sc/x1bp8bqzfhAhuyn8JiElW
	ea4b9K9xIoFY3SU8BVLqrbcgRTcsVZcD/UKb7n/AcAqBzauLTq4nb58DPgTyzpqTTm/ETea4fq+
	4dhW85OmhQ9vOYTXvrjw1wGwE0LtCEbMApJorYV1s2NxbKkPFnm+xHh6Nz4hEG2AnNS44IsfRkP
	Ouajs+S4zbGl2j1SaQ5bccjgqJlZ1NOwX4plZAH9qs0Q9A3c9EidlA5196q/9N+eQQXa12LxU5j
	BHSFbI07JxI12TSQ0fLYwtPb2G2RsjSvawg6+TLvw4XHB
X-Received: by 2002:a17:903:41cd:b0:2df:9556:6848 with SMTP id d9443c01a7336-2f03ef594famr19124795ad.4.1795151706552;
        Thu, 19 Nov 2026 21:15:06 -0800 (PST)
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com. [74.125.82.181])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f122548sm8506855ad.66.2026.11.19.21.15.06
        for <sashiko-reviews@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Nov 2026 21:15:06 -0800 (PST)
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-38318d69173so1040828eec.0
        for <sashiko-reviews@lists.linux.dev>; Thu, 19 Nov 2026 21:15:06 -0800 (PST)
X-Received: by 2002:a05:7301:4308:b0:385:496e:80d0 with SMTP id
 5a478bee46e88-3856f55636amr1795390eec.29.1795151705592; Thu, 19 Nov 2026
 21:15:05 -0800 (PST)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261119-ktd202x-et6326-v3-0-98b836b1cddc@telaak.dev>
 <20261119-ktd202x-et6326-v3-11-98b836b1cddc@telaak.dev> <sashiko-outbox-224266@kernel.org>
In-Reply-To: <sashiko-outbox-224266@kernel.org>
From: Joseph Telaak <joseph@telaak.dev>
Date: Fri, 20 Nov 2026 00:14:54 -0500
X-Gmail-Original-Message-ID: <CAPY4CJ4yPRNjArxyCrPwM3xWXfYXvjSYbzQBOeKcvYaroJojxg@mail.gmail.com>
X-Gm-Features: Aa3M54rMy6uhn3gPkviQr_Npz2srk2_GgikoHxo3cCJaL2GCNpZ3uPftOnUi6pc
Message-ID: <CAPY4CJ4yPRNjArxyCrPwM3xWXfYXvjSYbzQBOeKcvYaroJojxg@mail.gmail.com>
Subject: Re: [PATCH v3 11/11] leds: rgb: ktd202x: Don't let a blinking LED
 retime another one
To: sashiko-reviews@lists.linux.dev
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, 
	conor+dt@kernel.org, lee@kernel.org
Content-Type: text/plain; charset="UTF-8"

> Can a concurrent unlocked write to cdev->brightness in the LED core cause
> ktd202x_brightness_set() to disable the chip right before
> ktd202x_blink_set() or ktd202x_timer_set() programs the timer?

Yes. The race predates this series: ktd202x_chip_in_use() has read
cdev.brightness since the driver was added, and turning two LEDs off
together hits it on mainline too. The fix tracks whether each LED is lit
under the chip mutex. I'll send it as a separate fix on top of this
series, or fold it into v4 if one is needed.

Joseph
