Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D03634752E
	for <sashiko-reviews@lists.linux.dev>; Mon, 22 Jun 2026 18:56:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782154595; cv=none; b=gfO5BAkAN9DG3x23Fl9R2yvoUB139UmPht/of/NIr6HjP0Ue6l+t5euObP2JfrNARh2KVLL9Drwc1VNsriwTGa6MJbXdyJ9fLd69Jm3ryls/AOO+nDCvbe5aJhsdz434sVbUoSQDg7COs5cVqfzV9paZmQxNcfjTTjbmX3z8Fcc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782154595; c=relaxed/simple;
	bh=b/5AxKlfDLljDsOspE5bNyi8aD14GKd8wsmsXO7uUO4=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=Zz1aaXnrd3WUIDrq6JHqG2ql0r0Izp0u3ktfQgbKtzV5qLXbS5vsB2TUdtfeCyaJmmUM3qZoz0gQRKnMa5lkI+8Hg8cyrkKapH4xOYa2i+L1TB6LcGZLRxy5yhSUTDTXn+km+BcxMpRQ5ewqjWV+y0vJpesFXYDDyWEjWKLmB9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ixC7k2oP; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ixC7k2oP"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4921e4dd62dso1922655e9.0
        for <sashiko-reviews@lists.linux.dev>; Mon, 22 Jun 2026 11:56:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782154592; x=1782759392; darn=lists.linux.dev;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BGuX+WBhfDluwNW0VRTh1DIO03lIg15lXv1EuQn3pcA=;
        b=ixC7k2oPxE+Kym0vRH8TifdxY+KbnLYV4nSzzAa9NmypHJH+7Y2DrOtlzr6UFLELMf
         KtxI+jCnx/j7AOtSiK3sgOK4uK5pg6uUA8aTEU5Jn/nxcW6L+zzRwRsuwB7fWaGPC75V
         RYi4xHkPfAs1rzVqHOKUshJB1cMjiOiCzszK5P7Q+MDcWYHUjWL/f1R7bHDn5pibTRud
         BWN/xu8POF8JHD1EO5m/3JnQ4JnHG6WX4uD5DHueIcYvB6S6Xf3yrDzCRroLfnpiSBdb
         Zm7C7c0U4T0s3BCIvpeBnZykbtqCnsrUgvwDHvAZPY9gCdpzsNosWLAI5ppWvLfdvQpS
         lQYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782154592; x=1782759392;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BGuX+WBhfDluwNW0VRTh1DIO03lIg15lXv1EuQn3pcA=;
        b=Jx3u7xZrwwQJ1NBfGZKnm0ACj1JvNm/EfwxY5QC2ta2xlqA/9c2CmFcapqhUqF2Obs
         CKo/hn0pgexAiKGJiHrdm99elVHyqoM2kD1yOrclKVFnN9kOtTHgRJIdRjF9bOmW2K4d
         +AisB6BRc27PD3hLUT48ASeUDwsN8QQVmJPjx2uQjs15419HccuIQat55emXnssdShyU
         VUgoko2D2QEEzFHv6fVBOhJyoIR4Iph0OnkpXS6uVRTyRV25sFVud5DQ3A2CCMklKGID
         nW26SihpOOZeHPjWM+YzA6BV7kFVSik+rfuSIED+AwynfgSIPbC2yxan97HrgkWbasts
         AyXA==
X-Gm-Message-State: AOJu0Yz/aH3dr0umHuKq+RwJd7O2V0jh9JbtFasiynYeVVhC65Bqy713
	/Wda4ntUN2t1Lidich7gBJ7Xa0Z6ZTlmk8Y/xeL0+S0XPS7J7Nu2Ti3Jhj+cVQ+P
X-Gm-Gg: AfdE7cnRcRuckqKTDN8T67YxdSXl16ImqVEVIkwiidnxnh36Rc24G3vKcZ6dwPnbqL4
	WaLX/7V50OGUosTjLcVi6ZQifz92MXOtWVYeSUIzxuOXyONAe+ABjgVF+dDpIYfhGhpiAmpsBQr
	6OrpQCOH/fQyL9brclvY5rzXYIfTJhD1V6lsC7bT1uoDc7AByLkzcWSPBabLNZfYQfMFiUeuCeU
	Quj70oIeBcAFlL6fLwdjUWvjVtbrfbXZJitVgveUbjukXRl+6CBU6vFKjQRVaeRwx1SnMkgDIWr
	OYuWgOfJk0FLR3IKMXjy1//44HQNO0eV3dIjq4QUyAeqOM4n12lanzXpeHbljIJ8imGcyVrKClp
	+NMQE8XgtiYNwTrrf7tR03lAVx1zy2ychU3Syrl672NyfLpAFniWJg7ymRI/dFP5hVkjcjqC7CA
	Yu/tZDaljC44vXbScLfbC5DXgULA==
X-Received: by 2002:a05:600c:3e0a:b0:489:32b:ac0b with SMTP id 5b1f17b1804b1-4925a0a9ad9mr9493665e9.6.1782154592309;
        Mon, 22 Jun 2026 11:56:32 -0700 (PDT)
Received: from localhost ([2001:4bb8:19f:d19a:c1d2:e9fd:1b2b:136b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49245bba787sm193141475e9.1.2026.06.22.11.56.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Jun 2026 11:56:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 22 Jun 2026 20:56:29 +0200
Message-Id: <DJFT2RVYEMKU.3UA5K39W4GNAQ@gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: hwmon: chipcap2: Add label property
Cc: <linux-hwmon@vger.kernel.org>
To: <sashiko-reviews@lists.linux.dev>, "Flaviu Nistor"
 <flaviu.nistor@gmail.com>
From: "Javier Carrasco" <javier.carrasco.cruz@gmail.com>
X-Mailer: aerc 0.21.0-143-g2f3a2e260c09
References: <20260622122200.14245-1-flaviu.nistor@gmail.com>
 <20260622123206.593E41F000E9@smtp.kernel.org>
In-Reply-To: <20260622123206.593E41F000E9@smtp.kernel.org>

On Mon Jun 22, 2026 at 2:32 PM CEST, sashiko-bot wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issu=
e(s) to consider:
>
...
> Pre-existing issues:
> - [High] Threaded interrupt handlers modify shared state without holding =
any locks, violating hwmon subsystem guidelines and causing potential loss =
of alarm events.
> --
> [Severity: High]
> This is a pre-existing issue, but does drivers/hwmon/chipcap2.c lack
> locking between the threaded interrupt handlers and the sysfs paths, whic=
h
> could lead to lost alarm events?
>
> The threaded interrupt handlers modify shared state without holding any
> locks, which violates hwmon subsystem guidelines.
>
> If an interrupt fires between the sysfs read and write:
>
> CPU1 in drivers/hwmon/chipcap2.c:cc2_humidity_min_alarm_status() {
> 	...
> 	if (data->rh_alarm.low_alarm) {
> 		*val =3D (measurement < min_hyst) ? 1 : 0;
>
> CPU2 in drivers/hwmon/chipcap2.c:cc2_low_interrupt() {
> 		cc2->rh_alarm.low_alarm =3D true;
> }
>
> CPU1 continues:
> 		data->rh_alarm.low_alarm =3D *val;
> 	} else {
> 		*val =3D 0;
> 	}
> 	...
> }
>
> The interrupt's update will be overwritten with 0 and permanently lost. T=
he
> hwmon subsystem guidelines require drivers to implement locking for inter=
rupt
> handling and sysfs attributes, recommending the use of hwmon_lock() and
> hwmon_unlock().
>
> Could this concurrent access to data->rh_alarm.low_alarm be protected?

I agree with Sashiko's report about the concurrency issue. If an
interrupt is triggered right after checking data->rh_alarm.low_alarm,
the status would be 0 instead of 1, if no prior interrupts were
triggered.

Sashiko only reported this issue for the low alarm, but the same applies
for the high alarm, which is independent and has a dedicated signal.
I am not sure about using hwmon_lock()/hwmon_unlock() for this, as it
serializes all kind of accesses and not only the ones concerning the
interrupt status. That might add some extra delay with many accesses at
the same time, although the fix would be simpler.

The most optimal way might be using 2 different locks for the two
interrupts, as they happen in different lanes and don't share data.
If that is ok, I can prepare a patch to test it on real hardware and send
it upstream.

Best regards,
Javier
