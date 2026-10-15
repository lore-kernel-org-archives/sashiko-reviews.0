Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 821D844E67D
	for <sashiko-reviews@lists.linux.dev>; Thu, 15 Oct 2026 21:54:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792101253; cv=none; b=jkvfL0S7H1BHZIk4Uc1s7P6IGn3afOJeqYIQuZU75WYfqSRv1W+UlyiprA6OqALy7iy/GHcFoU4aeeCSI3TQ+9AIx2FLv4Sz6hS+06G/8WUT2K3D0bKFD0l3kepwGGWF1Xm3dzRyvAyFohpF+WtUNzCcjfAUJhHi7m+rc5s1qSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792101253; c=relaxed/simple;
	bh=mTWjh1JQrwNxj7ZlXA3XUGEhDVTf88r+HHtbsFOvNXM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JQrbx9iwnoodHu768fRWZ/33S+wpzxDSMa6e3C2c/jfrAnzvvP50w4/MW4fH62cUAuWRgeDwYJ+k5Is+XGhf4X4AbQqO1vjPiW4EnaRtGUnC+dCV8T4XPGpIxeAKbeszXwsBWKgmeCywFs1oBxzuQ7aSjFZNFEeHl09rbS3FyWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=qTPfPs6h; arc=none smtp.client-ip=209.85.222.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="qTPfPs6h"
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-93a40a9a01aso59252285a.0
        for <sashiko-reviews@lists.linux.dev>; Thu, 15 Oct 2026 14:54:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1792101251; x=1792706051; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9diFlksQ+a3TSPkkbPJqrE0Tb5epfFzmuOiQPjkFUKk=;
        b=qTPfPs6hyM2+W3gQtHg+7lshsYzw6qKQcTKT724j++i7dJlL/38mHsZPu8pfuphzfN
         3+dvl05f/PV9QfJd2m0oslgojbyvkTGevkA9VtRtNz8g1lqFxCz61Jto16YmXUVECz2T
         z1fINRtfKRMcnH+4MZTY11qYRfkvtuatVlY+cJD9VkVZNdXFOwOA7LF/KY0lkMY/LvuS
         Iklgxt0HHYS4cpcwrLI3rDu2RC5HfDW/KzW/arXn2MUKi4QsNJVNr7jKhh7v82uQEURs
         KyDF96A0pfqIJezbqC53mOE7v6olCZqqTt3H7nPzCOH9Inb7GTW80mNdv0TjW5Ggu4/a
         19kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792101251; x=1792706051;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9diFlksQ+a3TSPkkbPJqrE0Tb5epfFzmuOiQPjkFUKk=;
        b=cprLO0Ztr90CtP8gOC5yaceMYkJVZQsV7Gh3V7QWgmafnSsPhKNZ3re+MJHIYfzbMc
         yQesz6YRoFHACctHHerr3bHmKNIJKoxXByfqOR7QxQBzhp2v7JgB/94olhw/osbdEnaM
         YGwIBpWHR4cwTLpUFGzg8qXiLcCcMpEMJMrkOoubaBalk2Hkzckl1afSklDyL1gh8nYR
         3XPQhs9Eu1ur++p43GoxxXuA/vHeMR8yo6s+uhY/004kG5I1jYyzYOlgUpSWrSnbbn3O
         WaARzGcGleGRApj+9O/FUQ4IHe1yKVPiSQUax18kECuZbCBHYJU6ZJSwERCJXVGd+7mc
         yajw==
X-Gm-Message-State: AFq9FYLuaWzaqa7eyP1hlvoxPOF1/0h82Bg+VnTi+IKI+3ZowQxwDZH5
	RpBcK3TZQCtJliobRKAEIfzYEjSU44q9dEVhGIB0FlQniY7Tv5SSjBm10N72uPZGtw/UdlNzP3y
	J8EzN/0M=
X-Gm-Gg: AYBFou3RNcN+GjK3HT32PWXRdv4//LD3JijzHUb6mwsvkQ86xcsmtKpWTjOsdOFrbKt
	YcgNBgKM6mnsOxGnSZWkQna43OkHUiAYD+TmrKRgRQKs4hJLLjDKZ6r9JpgElehELPP8Q/4w78H
	jMvcI0YyaSduCgY16n+UVBcbKE9po6DmdxK4bK72RoRhhyaVncEkJKXTtwPmUEtOPUTKc9QvyJV
	9V+J2r+rq6lh/44/h2Pu/oQljVtv37W7pxh/tzEn5FSPgn1aCuCP3H9he0s4EWwttpV4EEFTdji
	hUiPHEGMzcQEB4IrId+aOYBsrt/tuGsyTiVIuVrSTF3oBznXOjIpca6akvYK6+LrWyBgQmceptF
	336jOdfpDiuCVHkqBmlXdF9nimJmYDGuktZtSEd4HsIT+qiurOiLPO0kTka4qkHPsl2rQY7Wpfq
	5hrqI7CT6M41e4Df9i1Mg74jZUWQ/G5LURNg3zMeKiV/nJS5z2I1GbuSjyC7e8JkuX+qOV9lufP
	ylBDSrUy5BMfTCO/hoKaHBiDsrke05SlcDrbBNePuH/Ap3vaLmrPM1AApYQPchU+A==
X-Received: by 2002:a05:620a:4801:b0:93e:5677:317b with SMTP id af79cd13be357-93f17f4a93bmr261885485a.25.1792101251234;
        Thu, 15 Oct 2026 14:54:11 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91bcbb1af26sm6141716d6.33.2026.10.15.14.54.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 14:54:10 -0700 (PDT)
Date: Thu, 15 Oct 2026 17:54:09 -0400
From: Gregory Price <gourry@gourry.net>
To: sashiko-reviews@lists.linux.dev
Cc: linux-rtc@vger.kernel.org, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: Re: [RESEND PATCH 2/2] rtc: cmos: Honor explicit use_acpi_alarm
 parameter value
Message-ID: <atFLRRT_RN7etz3I@gourry-fedora-PF4VCD3F>
References: <20261015173029.3091872-1-gourry@gourry.net>
 <20261015173029.3091872-3-gourry@gourry.net>
 <sashiko-outbox-173258@kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <sashiko-outbox-173258@kernel.org>

On Thu, Oct 15, 2026 at 05:36:16PM +0000, sashiko-bot@kernel.org wrote:
> > +static bool use_acpi_alarm_explicit;
> > +
> > +static int set_use_acpi_alarm(const char *val, const struct kernel_param *kp)
> > +{
> > +	int ret;
> > +
> > +	ret = param_set_bool(val, kp);
> > +	if (!ret)
> > +		use_acpi_alarm_explicit = true;
> 
> [Severity: Low]
> Will this trigger a -Wunused-but-set-variable compiler warning on non-x86
> architectures?
> 
> The file-scoped variable use_acpi_alarm_explicit is declared and unconditionally
> assigned here, but it appears to only be read inside use_acpi_alarm_quirks(),
> which is wrapped in an #ifdef CONFIG_X86 block.
> 
> On architectures like ARM64 or PowerPC, the variable is written to but never
> read.
> 

I could not get this to trigger. Neither gcc nor clang would fire this
warning for a file-scoped static.

~Gregory
