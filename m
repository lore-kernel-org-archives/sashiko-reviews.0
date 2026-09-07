Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA09847798E
	for <sashiko-reviews@lists.linux.dev>; Mon,  7 Sep 2026 12:44:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788785099; cv=none; b=dLB4SCKnZ4zl3lMHTtm5Hr/HGCwqSglMF79edIHytsUUJLP0q+C8SW51VHPXAGXOGBCwMXivXBcUTG5+0czedq/Wvdccf79kMzCDQrvzwVs66C7v72laX/uFoMYllilyiZdbZK22xsAifPi8K+Veuuxv/FLCSNHo3htcktF2bu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788785099; c=relaxed/simple;
	bh=B+iiOiHkAB3SjnD4jE/kaBzO11YGeGn0DnIBjQ/9GYE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tlbAEwr3XmepmVEMiklfs0QhulQh3/kLDVfsaRb8zH+HIQrOj4cGmwPxOM3uJwhSHPShJ6ynbES1yGPdTtI/SVkOLn0+v/dE+Bh/iV+GmwqJjTxTSPYEndPrMMdgsDyKPnszDqtUGutn7n+0v7W/dLE/A8Q/tErOAuAJKlJWF0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kfQIg2bs; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kfQIg2bs"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-38759bcd877so3519694a91.2
        for <sashiko-reviews@lists.linux.dev>; Mon, 07 Sep 2026 05:44:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788785097; x=1789389897; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pgRcHlGojddIrdA4thflhygGudJUQQ+TeRB5rtetsFg=;
        b=kfQIg2bs/QIKhhXQBRwMMFiYh2y9zDcWM98cDmzsBKWWADTe1b9oMcroWVaWcI7bX1
         M7keohCtg4nKZj/kc3t1wQIvIcB6SkXiPKOW5BVD/ujlhi7V5T5F/toDjUX81KoeMxCt
         ciZpFDvHWmSjve+g/7I36LzfUyHbySkacKwb+uzSPsWaYsbvYdSFAPnoJLy78p0JhwTf
         4FJRWpTE5lyrllXidARltT2iOZQ433YsQ3IAkRkwW/V7Q/7yQtTD58FyXRnY5edm5/Qa
         WZTBGyBTDHa0v9Ydf3Mdy/tqJFs33PrlHJB434ruoD+avIq5Wm6zRWKrSGCSM/ZA39AL
         zB/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788785097; x=1789389897;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pgRcHlGojddIrdA4thflhygGudJUQQ+TeRB5rtetsFg=;
        b=YAg8IGeV9UsS3lZwUCCfTjiipXhh/Nt4PPzO2svPG5a3+lZpJ+kiSO698k9unXOFdu
         ZTaxKBZsYEh3XgAmWmlF54rEP0bHbhAFuM4fZGkRP24bUKEAZD0SSxVV3YUv/veRyjV9
         ehkLGi/fxGiaU2wUNUMH0AgA0bQpWqxOOtRlrOxSaIIIaZxZzd4CS8XK/hPcxmnVFmNo
         bymM0rYeNr2e2Qy5dP1UpDk9bKuBImH9sv70J9Pk2kZZZUyX8GKGaFpvDkJ4s+WWlD40
         dCuHnQ3FhSFgshZvFxUpFiwjb6qpxCFq9lSJ9+MIiV3qNeehI3YyQS4T1bCpWwe/w/Yv
         rgAQ==
X-Gm-Message-State: AFuF++nUJSYAai4qF63bj4NL2Yo/+mZV13KXHRFfh2O2fw5ai8/hzqfg
	keEs07UAOqtVodF4IsOdWbYngw+5H80Zm0JNnY5M/gUoJjSEs6v4jeDgHXqnplY=
X-Gm-Gg: AYBFou1i/xwRaWKRwXdzg3PGbiiqnifDcs7gzl+uxUhGS1+WykK757mVVesZQrnWIXn
	GZK1iYTN0HRSfS12Mj2PRTX4PHYz7jv0fvB5at29Fkc+U084vfYvsRdDBFvtOjBGigWNo/9BQ7J
	+UMmZSsqHinYycwy38qyAMdjC4iTUA/9vqyBsuKixTQRvUiCcGrOK5JJCwW/LijBKd2lyqK0OwH
	aR1/MxBJDTkco5n54MzEjFjhadyC5xantPqMgzJ/spEKqYuEM1nRCmEDNPI8YXzYiW+j45V7oE9
	GXsBPLXYn9dUWCVyIIwFsDWhJMja6HlkdAc2Zj8464gGYlp9tfdCwx9ORA3vEBcSKWOYjgboC/L
	vqGcYo6tkNE87e/GgmeAigffinrxNfikbNwxC2lF0EcSuyw9gzW65vJcQ67bEdgr1dtw8i4fIhe
	p6+x4CF+FPKF964cQ6O66BLB96c9on83uXxzhszvAJMnqLXEj90hri1DCxpi1nCN98h7QW8/kNU
	t0BNGLwF5C1i9Vy
X-Received: by 2002:a17:90b:5844:b0:398:dc16:3c29 with SMTP id 98e67ed59e1d1-39b26101530mr34967440a91.7.1788785096980;
        Mon, 07 Sep 2026 05:44:56 -0700 (PDT)
Received: from ydg-Zenbook-14-UM3406GA ([2001:2d8:6467:d689:c773:5f09:906c:a72b])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b083e4fafsm26491178a91.1.2026.09.07.05.44.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 05:44:56 -0700 (PDT)
From: Donggeun Yoo <donggeunyoo.kernel@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	linux-trace-kernel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	donggeunyoo.kernel@gmail.com
Subject: Re: [PATCH] tracing: hist: set the trace clock before registering the trigger
Date: Mon,  7 Sep 2026 21:44:51 +0900
Message-ID: <20260907124451.607209-1-donggeunyoo.kernel@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260907092944.3950E1F00A3D@smtp.kernel.org>
References: <20260907091415.554535-1-donggeunyoo.kernel@gmail.com> <20260907092944.3950E1F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Mon, Sep 07, 2026 at 09:29:43AM +0000, sashiko-bot@kernel.org wrote:
> This isn't a bug introduced by this patch, but does this error path leave
> the new trigger on the global named_triggers list?
>
> If event_hist_trigger_init() fails, the trigger is never removed from the
> list before the function returns the error. The caller then propagates
> this error, eventually calling trigger_data_free() which frees the
> structure. Can this lead to a Use-After-Free list corruption when the
> global named_triggers list is accessed later?

Yes, and so does the second one. Both end in the same read this patch is
about, and neither is fixed by it.

event_hist_trigger_named_init() publishes the trigger before the only step
that can fail:

	data->ref++;

	save_named_trigger(data->named_data->name, data);

	ret = event_hist_trigger_init(data->named_data);

event_hist_trigger_init() can only fail on alloc_hist_pad() returning
-ENOMEM. Forcing that, with this patch applied:

  BUG: KASAN: slab-use-after-free in find_named_trigger+0xac/0xc0
  Read of size 8 at addr ffff888009346860 by task init/1
   find_named_trigger+0xac/0xc0
   hist_register_trigger+0xc1/0xa00
   event_hist_trigger_parse+0x3146/0x6af0
   event_trigger_write+0xce/0x160
  Freed by task 67:
   kfree+0x154/0x420
   trigger_kthread_fn+0xfd/0x160

> If hist_trigger_enable() fails, it drops the trigger from the local file
> list but then we jump to out_unreg. Because the trigger is no longer in
> file->triggers, event_trigger_unregister() won't find it and skips calling
> cmd_ops->free() (which would normally call del_named_trigger()).
>
> The code then falls through to trigger_data_free(). Does this manually
> free the memory without ever calling del_named_trigger(), leaving a freed
> node on the global named_triggers list?

Yes. hist_trigger_enable() removes the trigger from file->triggers before
returning the error, so the list walk in hist_unregister_trigger() matches
nothing, test stays NULL, cmd_ops->free() is not called and
del_named_trigger() never runs. Forcing trace_event_enable_disable() to
fail for a named trigger:

  BUG: KASAN: slab-use-after-free in find_named_trigger+0xac/0xc0
  Read of size 8 at addr ffff8880091d3160 by task init/1
   find_named_trigger+0xac/0xc0
   hist_register_trigger+0xc1/0xa00
   event_hist_trigger_parse+0x3146/0x6af0
   event_trigger_write+0xce/0x160
  Freed by task 69:
   kfree+0x154/0x420
   trigger_kthread_fn+0xfd/0x160

A control run with no injected failure is clean on both.

Both fixed here:

  https://lore.kernel.org/linux-trace-kernel/20260907124420.607097-1-donggeunyoo.kernel@gmail.com/
