Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBF5A46D090
	for <sashiko-reviews@lists.linux.dev>; Fri, 28 Aug 2026 13:59:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787925588; cv=none; b=IkLMhz2kldJKVJTe5TkBuiWWQYxZz9/kxEmkeLzLlgWSpbfzRfT7Q1hte9PeCEUzrrTSDlCSwYuWFarnwjvz7C1mAdBs+m3E/UiyhAn9U/oMobRlQE63QT2QUlO3ccF3FL9XlO0dPUFBUfR4njX2qKNIrMQOgH/bpY1ULvGDpj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787925588; c=relaxed/simple;
	bh=y6KuGFmXIEB/zhRMWuseJanpRZIxUWUxZTjuXV40lYM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nQYkPkUoEtcO+5UGc6K7iTH9FucWcmWrl2i2l/N56MfKCYUGNVDjUDedGXyX8EhWjzE1lUStoveNII+oH993am01hH+jKCNiWs6xWj3mlHUnTj5IA4mxRVauHDPh5tkmC9LhOzf7V54KV6ZZQwtiAkWE9R+TyKIrCLRqgXiGNAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ul9VbBer; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ul9VbBer"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-47c2b362ee2so724379f8f.1
        for <sashiko-reviews@lists.linux.dev>; Fri, 28 Aug 2026 06:59:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787925585; x=1788530385; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NqZUeZ9L8VF1vTIFkMSmSiqi6T/ciO8jy2NnvOaW+Gs=;
        b=Ul9VbBer6HA/4IhAUAeklnMdQUsNIs42uA2UimLqSVxeTW2AXIdPVjeibZ2AHbUMqQ
         d5JtjO59LDFuYeCQMHbGd30xL5adQQnfoYcUhIWWwezzsbNJYs1JIaiW8j3AON0gPynE
         wTD/GizQ7dKTUCdBDa2upccJVLIq0GgzfJ+l3Qj3Ko0qyw/eKFm6poHrkXa9UQRPUCOx
         pdEGTLTa6U5X1o3Ft0MhuXjFm5g4GLBedBFkLevEBibmMbd7HWkamMrgLqgpTNdgTHbY
         Yc3Mo3uK9cM498qBq/NBDfsuj2ojN6AscBMbk1lAV7Gwuu8JquIDQynvO16jjTErd2yo
         nLQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787925585; x=1788530385;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NqZUeZ9L8VF1vTIFkMSmSiqi6T/ciO8jy2NnvOaW+Gs=;
        b=s7GmeZGqrbXEbgIkBt4/3/LhjbfKPWoH0L2IJ18hWutVEAapekOwieu3484Sqm4CWR
         CL2jFMTFWqG4zjEi17bk2HEywFxnMV3IsGlxaTtA5rkRizBzhvA/cUHhMovo42EgP5JQ
         XzuW2D2vSuefPIDj1RcMV6HLFTB9u75mkOQ+fmGxe7STUfSqKaFC1G8Sbv+uM8T3LnbF
         9Tebbyz9jklTIY/8e42hOwFbuBbe4KbndHrgsrO2XebtgI/mfwvbd+wPT09WaI5NZGOX
         kHoDhvZczjFDeWQjwUUP8RGecCvAmrwvDa1R8QIkNEMmdIYvHe0l4CHfVCOUXfuwWjnd
         1rpw==
X-Forwarded-Encrypted: i=1; AHgh+Rqzh8qFwWU26u67p+erjIwdt4zV6EMRb4BM7KbQAcvJtrLUXcl9BJqok3SWue7i4GDVExFfn0kHC6B2vvVps/g=@lists.linux.dev
X-Gm-Message-State: AFuF++nX5zGW0XUhUc0asWbvvGPs0Y60ALQJsNoawwrw7937zzbKrkbz
	jcQdl2vhbrDvbhyLSjKJpfHdieL1KMI1loDf6tWsPiEx92rgWh+kHIYM
X-Gm-Gg: AR+sD10CqlZinNTd44L/gYEq0pNchQvgIROZ1jEtWruHwUc5q9ENGSQlov6eEnDGdBO
	v5cIXqUp5FDAgNX+vaec2QbnOZxBvlhTIcLjUQmjNFt9QWUxeZBrVFd6nlFshuAIT2xxzN2XFjm
	VS+os97+PnyVlfW10Ku9MXc5ONC7mUkXQCa4gnXK+IZWCFxtMgbrZlJEskJFTbrqkzu4hBFf7ay
	ykfu4YIpGJI9o0/Am+f+O3Yiy7oIuzyu97pi9+0fjEVOFTNLGzSVPT+OaTYaQLTnqFdc1s/WkWj
	zRSWBa5fd4Grv9Y0n8Knjyfhl7WzqNyWN948xYUZ6jd60X1ex1YE1ByaLWeo/VAKY0KmpNsekLw
	R6d8gxteqrt2SOkVwmwHReaZxIPH/Z+hzFGuPWXtBemmPPmykw47/aP5AVcqlr7RqClMfB6rF0I
	fuvwrLKobQ5lcqATs0FIwB+vw2yZOsVmZiYc6JuM7S+tcFJmRb4D6jLQ4qmivVZjPvr8kKsRl/f
	g6V8zAUaP5YbtOz6apHVI6kyemIvN8hEiiLa9PdrZ57a4tHQ/7fP8VWc/5VV+qzXWmtdVtE6fl2
	zXIE5wt4fVpI+HA=
X-Received: by 2002:a05:6000:2388:b0:47f:9283:1fb3 with SMTP id ffacd0b85a97d-482f7828315mr10404375f8f.0.1787925584957;
        Fri, 28 Aug 2026 06:59:44 -0700 (PDT)
Received: from robert-83cx (static-dsl-191.87-197-115.telecom.sk. [87.197.115.191])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482fbad08d2sm5220828f8f.16.2026.08.28.06.59.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 06:59:44 -0700 (PDT)
From: Robert Bozik <robertbozik@gmail.com>
To: linux-media@vger.kernel.org
Cc: sakari.ailus@linux.intel.com,
	mchehab@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	media-ci@linuxtv.org,
	sashiko-reviews@lists.linux.dev
Subject: Re: [PATCH v2 2/3] media: i2c: Add driver for OmniVision OV32C4
Date: Fri, 28 Aug 2026 15:59:41 +0200
Message-ID: <20260828135941.23605-1-robertbozik@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260828133537.C61EC1F00A3A@smtp.kernel.org>
References: <20260828132104.21473-1-robertbozik@gmail.com> <20260828132104.21473-3-robertbozik@gmail.com> <20260828133537.C61EC1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Fri, Aug 28, 2026, sashiko-bot@kernel.org wrote:
> [Severity: High]
> Potential NULL pointer dereference in ov32c4_set_format() when
> sd_state is NULL.

I checked this and I do not believe it is a defect here, so I have not
changed the code. Please tell me if you disagree.

The mechanism is described accurately as far as it goes: check_state()
only rejects a NULL state for V4L2_SUBDEV_FORMAT_TRY, so an ACTIVE call
passes the guard, and __v4l2_subdev_state_get_format() does return NULL
for a NULL state.

But that function opens with

	if (WARN_ON_ONCE(!state))
		return NULL;

so a NULL state there is treated as a bug to be reported, not as an
input to be handled. And 37 drivers under drivers/media/i2c/ assign
through it exactly the way this one does, none of them checking the
result; the line here is identical to ov02c10.c:712, which is the
driver this one was modelled on.

So if that path is reachable, it is a core problem affecting all of
them and the fix belongs in the core rather than in a new sensor
driver - adding a check only here would make this the one driver in
the subsystem that does it. I am happy to add it if you would prefer.

Thanks,
Robert
