Received: from mail-qk2-f12.google.com (mail-qk2-f12.google.com [74.125.230.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED80E3EDAD2
	for <sashiko-reviews@lists.linux.dev>; Sun, 27 Sep 2026 12:47:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790513245; cv=none; b=COWLOV9JYDa5Mk7XH9dbT4+bi7RnIrUnCCM7YtiNQc6Sq1s8lH9rZ2zrbJ7zDnK5gdaQTgaXFte4Nj4qpBNn8SI3QNVAdr9z5wsRBhBVNuBDfMVTntgXTc1f4i7WN9RkOk1l9UPJJGbrYzvdk8UzdqkYMhNqBWhZCcH/Ih3HhNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790513245; c=relaxed/simple;
	bh=OzC1ipp50gKSQmUI/wHay6GiqAVGkfRrDG+NGkkq9Og=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MBY5DLzPHZ18HH3tlNf7d5FTjAEWLh/NzFKUyk0Ti7/2DhkAA8p32jEM/jK9lWso9zoMKGUaA1d6a8rApy43sIfeBCCT2wHj5FOG5P6tUuSOid04EaJXu5+8mcq/mfEQoHeEjxzDJLe0MISozaR1OUe1P3CyHpvHbgORJaszBlo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ck3NIPQb; arc=none smtp.client-ip=74.125.230.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ck3NIPQb"
Received: by mail-qk2-f12.google.com with SMTP id d75a77b69052e-5309a20a55bso24685861cf.1
        for <sashiko-reviews@lists.linux.dev>; Sun, 27 Sep 2026 05:47:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790513243; x=1791118043; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NgI1lTx79u03eoJMlNZF3q2Q8hZET9tAZCH2sXH27JE=;
        b=Ck3NIPQbVv2sHww+n2X/6TtnjZpzcO4u6T3Nj/9gF6aCIWogzF/ePk0QEYn0dcAhfu
         S3XlY8mlhmxz49nFiULqg53M/k7vEW2T5wZExl5BubRcrvKJvXgPU3tjCgeYYx8zIkjv
         sZswo7hcEQkAUL8RYHwdjf/Os1b7+yRZDWOT6vpECnqt809slE+mlrn0qC9P+bC72Xgt
         /Gg3pACEXeNihiP/19hY6QkiHFZcmoqUBoSRJsGMRO9XioOEvThrQ128uAO3/Uzvg7QP
         uOH0wPgmZpqnh6ZO/J4AL+ekjZTuxvk80P4NU061jYcKrBaD3OeXrXZK60PQV/eeldnS
         2c8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790513243; x=1791118043;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NgI1lTx79u03eoJMlNZF3q2Q8hZET9tAZCH2sXH27JE=;
        b=1O5P+KKrAfd1f13PoeLmJhyPUTXwPh1D+ZsFJXnU08ceSA7g52QYGgzXXIWdbzM9qm
         xxxSUhl+cmr4avLwJlJhH4fLYRBYjKOnZxXhUdoVMxFuhSujTwn8GS0zFWN9FgX/M5Ek
         Mh+YQddB2YN4s5Rzxm5ixYm9M3vuIThpL/vz1zjL4m8Sc+M4RNPMuQRCsvB7Cxf2JY1i
         V0danDbsU3t8jH1hgBJL7j6TCzqINIQMy4IsOIBhg6X+EyIUrlOkWpuyvW85YNebMCOJ
         x022BfS+NImhO49eMLvXKL+D+79MKR6+Mi9LLMhoxyA6JOd/9kSeLDJXRBpk2pB70leV
         J2zw==
X-Forwarded-Encrypted: i=1; AKwUvBxA46jMC5bhAUoL2y+wjZAovWNeJyDrRYvG6XQ5vFtWpIQylrY/ep0W7lQLdJBlUm19K7uzLISwiJWwPOPVg4o=@lists.linux.dev
X-Gm-Message-State: AFuF++l2lkpXDtvJYsMIo4rCx7ish3tFI12zPC6IPZLUUjHNoiAnHFk2
	+TZRavrm9yHhtHu+BumV6yk5Z050zpjI4UpRqF/2ttCEI1p5PCFv0Duh
X-Gm-Gg: AYBFou2wqIZXg/Bc02EW19DZ/sFAslpP7+f2fAcvWm3WcFG/lpPlxF8srJfhhAkdH6D
	V7JjDLJROiCLwqm6INDlJVO4DIO09SovH+ns3WkkY6IzsA+uuLjhCia3RYfEDgKXD+Zq20CSKP9
	Vdq5TulIEHrNah5EoRB4tT7K+2w5BCaq7WszlcSpm7a1p0hu6o11mBSahrHfU3vJZ1VEGPMfCzB
	10D0824IbbbzrXRU7iwwbJP47fSeF4MqJgfsik81UZrl7Czsa2I7t2fkWMaLRLd71jlA8jDJRsM
	w7QAqIVTKeypTWIOZzbL0/LPnf+Hf+97MHo1sLQIFwfE3GvTXqo0pBr9finWZPatozZtNhs9edc
	RPcmv5Ee+HgdBtuw4cLKK67cgw16SOmmhqlEaHuNiIE69cg+lN8sa0kGrAzkoQPQ6ahzZkkmWmA
	/bAfijHZ0TlFVGdQjUcZ9ptD6borE/f7sCuOncREs++ms4EugM8PtnLslpFVFEHkOH1ckowxwOO
	wYT6K+DzAs0JxlF/Ky7DRluRPYILmpjW51/LBoQKIzEOmXInRrwb6la
X-Received: by 2002:ac8:5f0e:0:b0:533:34ed:1956 with SMTP id d75a77b69052e-53334ed1b61mr53236161cf.14.1790513242878;
        Sun, 27 Sep 2026 05:47:22 -0700 (PDT)
Received: from Z-System.tailddad04.ts.net (c-68-83-199-219.hsd1.mi.comcast.net. [68.83.199.219])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5332225b709sm40569201cf.13.2026.09.27.05.47.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 05:47:22 -0700 (PDT)
From: Zac Lanzon <lanzonza@gmail.com>
To: linux-hwmon@vger.kernel.org
Cc: Guenter Roeck <linux@roeck-us.net>,
	Aleksa Savic <savicaleksa83@gmail.com>,
	Edward Blair <edward.blair@gmail.com>,
	sashiko-reviews@lists.linux.dev,
	Zac Lanzon <lanzonza@gmail.com>
Subject: Re: [PATCH 2/2] hwmon: (asus_rog_ryujin) Add pwm1_enable for the Ryujin III pump
Date: Sun, 27 Sep 2026 08:47:11 -0400
Message-ID: <20260927124711.151260-1-lanzonza@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260927121932.72AAE1F000FF@smtp.kernel.org>
References: <20260927120927.72810-1-lanzonza@gmail.com> <20260927120927.72810-3-lanzonza@gmail.com> <20260927121932.72AAE1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Sun, Sep 27, 2026 at 12:19:31PM +0000, sashiko-bot@kernel.org wrote:
> > +	now = jiffies;
> > +	next = priv->source_changed + msecs_to_jiffies(RYUJIN_SOURCE_CHANGE_INTERVAL);
> > +	if (time_before(now, next))
> > +		msleep(jiffies_to_msecs(next - now));
>
> [Severity: Medium]
> Is there a risk of a massive unintended sleep here due to a jiffies
> wrap-around?
>
> On 32-bit systems, if the elapsed time since priv->source_changed exceeds
> 2^31 jiffies (for example, if there are no source changes for 24.8 days at
> HZ=1000), time_before() can wrap and return true. This would feed a very
> large wrapped value from next - now into msleep(), causing a thread hang
> when a write to the cooler duty attribute is attempted.

Right. v2 computes the elapsed time with an unsigned subtraction, so the
wait can never exceed RYUJIN_SOURCE_CHANGE_INTERVAL:

	unsigned long interval = msecs_to_jiffies(RYUJIN_SOURCE_CHANGE_INTERVAL);

	elapsed = jiffies - priv->source_changed;
	if (elapsed < interval)
		msleep(jiffies_to_msecs(interval - elapsed));

Patch 1 has no timing code and is unchanged. v2 follows tomorrow,
retested on the RYUJIN III 360.

Thanks,
Zac
