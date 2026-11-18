Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795035441;
	b=yICmdczShtS9KIQOJNNRvPAEkRsNPC/JI4luhDrH7fgmBw4/c3PpsRF9IRz8tA1q8jEY
	 Phi+dELzpnraKfBBomeIe/HhrTsAHQPnwDlFOzJy9To7nN72OgWr7pBqcqOKFYtbC2eGn
	 F6aA0FHjwOtn3XluFKsxdh/WS7Vgr7vjwbVeHiRTMmCUc8dejgHD4ZC1R9y4rb/og41Mg
	 GyeFjJSm2XO5WjlFYah0dF1aK7EZ9RWGyCtyzlmmbgxnS1ZHJ0CT4xesdnoJQ9XWk0JoS
	 iPqBlEAWcOl9SfrNZkaprjCU4wN2RBswc7ScJKVsfV67qcAfJPBwwXyUU7Vd6hfIPCw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795035441;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=rD0rqzmylq+YWadKYJUM3h2KbEjwE3lCD2TvIMgXYy8=;
	b=gaBLDbwmi48jknD3QEGaJlzy05LwaKcFpm86NpO5hyQYfrIiID7wQOEgcC7iZIJ3cMY/
	 Y1sBqOz2dHKpW4rExbHZVvcOR9OhYkAvruGyGZ3sAdl9Ve8LhtLmMBERJrHn+4WdTn2a9
	 3vh0lsuqCRxGV1ZlSVKXgLb+61SKvJcK7xAFzqQG2VfIxis/rF/kCgB8SmbP2Y6NpC2JW
	 Ia+7U7DlABlsXmH5e479Md54HXs76PGbiBI0FoM7E60KxASbSE/nH+7BqZmTjP3zlii2s
	 DJpB2C2uQO3IDhX4C9OogNWFiYdg0MgpiLErCrm0cJoXfnJLsIt/2cKXZmjwYOKbGBw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Y8ZCevYk;
	arc=none smtp.remote-ip=209.85.221.52
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FBEC606A32F
	for <sashiko-reviews@lists.linux.dev>; Wed, 18 Nov 2026 20:57:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7FBEC606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Y8ZCevYk
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-48dfc0421d9so1378579f8f.1
        for <sashiko-reviews@lists.linux.dev>; Wed, 18 Nov 2026 12:57:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795035440; x=1795640240; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rD0rqzmylq+YWadKYJUM3h2KbEjwE3lCD2TvIMgXYy8=;
        b=Y8ZCevYk9JwYxG5g5yiC3Hhro3VtdBVdL+qD6cSStjyXhm0/wUP5b83H1m/SRzNjUp
         PuayOBtGVHO14cCcWYTsApgzFK1RyolGuHqqq0WRYNyCYRSuaMSgRrbgasihD4IEavve
         uyi8tKk2iAseIlIv0pVB5ufckCof8152SdO5wqsr6giWyieiQpebP8PuqCWNWhYTZPj3
         RlyrO94j/d5s7VfI8OlZgcTT8JBlIYsuCtMBtFiuOPueYMjVZc+xq7t9zp02LOvOwFW7
         Af5xUsZdPU6ix60J9mn+0OY4YNMwePnub7ZZM54ChTCsD4q7qmxMvS2RZL4zpD5gXKXm
         YL8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795035440; x=1795640240;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rD0rqzmylq+YWadKYJUM3h2KbEjwE3lCD2TvIMgXYy8=;
        b=zYT/YtZdcpP8U1M8mlW3dnBn3D4HGvCZ5u3FPw9E+kPDeFV9hWESGFVdH/wU4wk3PJ
         /vR4XotImdHduwOAsLydJn9smZV0OdfOjEQhve7w7vyO+vgGj2BTegaF2E1GLtB51Dfp
         fvDOJGTbVq7NwRBaAAl+YBcRI2QLhliHob4FHZCX+Z9E3wllq/aFHh9hvnEngKvX2mtV
         wg9hHXWGc/BwsSDKjHa/b/tslxw4HfezxKqykU7E4z2iY4RkGq1wIGG4KkDHYO8+6jO3
         PgKS/ChmmlWCw2oqQKHhAEtOspvNBh/l1UzDwCHbC7kjSlWgFdhFroSM2h3E5AxUviHt
         oq5A==
X-Gm-Message-State: APuU4Z/4m3ZN0z1MLddEm+afGdimrRcvE0DM6EvlaCkaDomrGFsQGlqf
	AVGdaPx7cM4pED8t8hPjzIRtH6XndiFyGeGAXGKn4CGPdGiyww2c3jRXAmlXnO/E
X-Gm-Gg: AZFdTZd74gs2Pte03xWCQeOZTvrGiSXy0QfzKdUFxyOkgKGFqp+PvWDj5w1dUfP1rB3
	Ruq9Ia2KjhfvbzAsG6SGAIKJ2xO+q0riQ5ExV58qnWONbX/A2iAzHkfbWTgIIhcOSHnVzFKFPW+
	Pw8FZMQLymXzmGIdHMUcb9yWYVQQWmozwXYOkV17cOjDH+08Q3CUfS0OKCP0dcpUBZs/XKTwK9d
	kfj6zzUAZKYvydTDl8D0zP4jVL1R8KMhyLpXj7OrkQPPLsWxRgE+os3Rj2bAGGJe29vNpolPITl
	MKV8GvBQQ6R9R5qUHJS5Zq1eNLX5W34EygcPtrt2wppOwlzLgWZYuYE/BPbvKl/pZOim5+rzHk4
	fzoWVsarn1uMmGcR0E/StB7znrNs7KL9TVYHqhKvotsQtgP2nMMIhiJ36NohOhHXz+LiDIIXXUp
	LXiozrKJz4QJLPRLzOhTj3idaXlJ4r5Hus7ZE2TSO1YDARGx5Oq2LihzkmDNWbKtKQZcDZWFKX3
	LHKhZO05xWlNfBxG3AeF3RVGci2fF/2Ucx/6/JzL21Ci22UNHuE3oj7WpoqRAVyNi4plWET0b4K
	eTMLiIiFvVym47fEh8NZWI0CO2Aq
X-Received: by 2002:a05:6000:2f81:b0:4a9:4dfa:c151 with SMTP id ffacd0b85a97d-4a94dfac238mr347385f8f.26.1795035439821;
        Wed, 18 Nov 2026 12:57:19 -0800 (PST)
Received: from m2.. ([37.142.154.208])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-4a65560bd46sm6675311f8f.31.2026.11.18.12.57.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 12:57:18 -0800 (PST)
From: Michael Zaidman <michael.zaidman@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: Michael Zaidman <michael.zaidman@gmail.com>,
	linux-input@vger.kernel.org,
	linux-serial@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	dmitry.torokhov@gmail.com
Subject: Re: [PATCH v4 11/16] HID: ft260: workaround for TN_189 errata endpoint STALL after enumeration
Date: Wed, 18 Nov 2026 22:57:10 +0200
Message-ID: <20261118205712.49261-1-michael.zaidman@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <sashiko-outbox-219658@kernel.org>
References: <sashiko-outbox-219658@kernel.org>
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Tue, Nov 17, 2026 at 08:50:51PM +0000, sashiko-bot@kernel.org wrote:
> Can ft260_reset_and_rebind() race with an active ft260_probe() when the
> driver is bound outside USB enumeration?

Thanks, this race is real. I reproduced the order on an FT260 board
with test-only delays in the probe and in the reset work: the probe of
interface 1 passes both TN_189 checks during the unbind. On this
kernel it then fails at its first HID raw request with -ENODEV from
hid-bpf, and no subdevice is registered. Without CONFIG_HID_BPF,
hid-bpf does not stop the request. v5 fixes the race in the driver.
