Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C9EA3264DD
	for <sashiko-reviews@lists.linux.dev>; Thu, 13 Aug 2026 14:21:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786630895; cv=none; b=SW2M9h/phihcKe+jxllY89mtvuqHwE58evvQIVPs3ZZLCmG3KnPcYJu0xilmeanHEcmx4QTtf+obpFIL5JO6Z5x20S+SY6BomWp4cc2UAhesRIYkLvRoNqdhUpL9L5i66gI3t+n2uFYR7zI1MxxkXQzVNpcbi7+qHCN/eDE6BT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786630895; c=relaxed/simple;
	bh=1BngQDqStPy4IbAN/A8pfaIz1nplmIope5AI7+UIB48=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PuQUEdXhr4fCxDGQ+FTbVcMLkO6AsW9rTo3a9YiVHLEYzASBd47moaLjxUT2TIyEGorLY+e4x1OFlmUGdz4VCXfU3M67P4JopzmvD8HyePkg+r+qT/8f+iCwwl+QtJtsfQjV0jA/3MitCI8jTgGh/xOAxYzzorrcTziIjqnVsao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Sysz1F2T; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Sysz1F2T"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-47362928f65so1813375f8f.2
        for <sashiko-reviews@lists.linux.dev>; Thu, 13 Aug 2026 07:21:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786630892; x=1787235692; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=JcHbtPHDcFE5fkEu2tD+QxgHH1BZ1IzYrTBReRRcNS8=;
        b=Sysz1F2TLiiqYzStZ5oxk0umYqeojl6BNFeASBSo/6XPennARP9nNgQhk+MFXvT6JA
         7k4o4mVvRmpLpb7ZjlaOrhXBhaBJ3P8VuNkybn8Y/dBCxALOcfe6i9s4ubB+VAP0tmeT
         IXDmtlGimv8rlPw2Yr9s2Li9UCgQ6NrPjyrS+TEk31dnDPF/mCZuVimY8+qzirAHBQEy
         Yho3jtjjFrjz4hIyFuTkDGWYQAWPbYSC9RiSqgH8ngrSAQYVu2tGx1+a2Wpp66CcjvNG
         ma1acaeV/mk3r7TGqzqyld12Z39MkBF7tltl0kghomtmGeDmFNsAYSjpqdcvP/4BuOv1
         eleQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786630892; x=1787235692;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=JcHbtPHDcFE5fkEu2tD+QxgHH1BZ1IzYrTBReRRcNS8=;
        b=PZnEQyw+Om1IzW5X5Nf/5pPPnUJL5LzuKlTxAGQZQKsvyJbGg45hmsDDuO4gZLIwTd
         1585hD0/HY/rWG1u3QV1K6xUwM5rwLF9tgPvkjAoRZTTUiUq0aLFQwKu1meLFfbMi5bn
         kSRWjBd7XLyqWEs1pdDcszXv7C2Z23J2xYrgDruOZw4eS+q3d09AupmU/KtnQWt0olqQ
         cxyrkIrt2teOzuCmZNqwlsL19qErD1bZy0YGKkH2f97IgKnYR4Kh9J3T09Y97tPpkw+f
         UVAXSYQ47v6Nya3bTHMJ2KHYj3lfHU1hLXykTj2ImORpjr1xAD/DOM8onhdCVDqu55ia
         6v1Q==
X-Gm-Message-State: AOJu0Yzc6cyMt2ljxlZoRJv7nBq+HnJtPC/b64ChNEZW+uTWB53eYRvz
	MIVOhN0nQfHiQoEYmYgpsIJKwUfo0+qvjumPcgn7pL0rRR6JaciH/VJ4SU197Cl2Uqk8Eei36N8
	GdiX2TA==
X-Gm-Gg: AR+sD121IiK3DTcxM1Spije7AlYc4i3ZGtolNLsaSI7XClPOT5L6HPS3rk8SXgT4ggz
	+D4nL46+aOaeZOHkbkd1w6zjSBvVSPMBwSYmb/X3dPAne4DjNw2v+UQNEb8+u5mHnwcvM6ZFO4C
	zxiuQ+eeYcs1PnLvrjfIvDqzVMkFAWFUh+04mR/rGsXfG6RFYinkG1sxuArozVydUtgRa8tDZq+
	b+eXjq04cgiyNLd3bAu5fbznP9DBSx04npHJfjKF8gEfvx5FyQDPWPrkbTx5Q4pydeC6hZnFhR8
	kE3/Lk3a0SqgeA5rAjvOqnn0e2qn3C/Zn/beT7R//yjRwT6JzyDdGAzu0LdmnTzPJOVbTjHJIsa
	Sfy5YZ4jYMr9rPq4h4HDzRl04/mQ4lVrcRe2ugtSHK9kzQRhlg1UMRTuMPkN0A1ZzdL+hDtV/Zx
	5ivN5leKu/vq2l4xUq5R5aDaM6RtK2/FBWELY55FaU7sFZGrx77c9ZfG6t/L7A88Hc6np51cfbX
	UxifkQJGYg3V1ozPAWVCE1nwaCLw0Xx
X-Received: by 2002:a5d:5986:0:b0:481:4761:45dc with SMTP id ffacd0b85a97d-48159ec3b8amr10253257f8f.13.1786630891044;
        Thu, 13 Aug 2026 07:21:31 -0700 (PDT)
Received: from google.com (135.91.155.104.bc.googleusercontent.com. [104.155.91.135])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4815a5b6f94sm6645063f8f.32.2026.08.13.07.21.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 07:21:30 -0700 (PDT)
Date: Thu, 13 Aug 2026 15:21:26 +0100
From: Vincent Donnefort <vdonnefort@google.com>
To: sashiko-reviews@lists.linux.dev
Cc: linux-trace-kernel@vger.kernel.org
Subject: Re: [PATCH v5 16/18] tracing/remotes: Add trace_remote cmdline
 options
Message-ID: <an3S5rK5dLZkADSU@google.com>
References: <20260812161340.2417322-1-vdonnefort@google.com>
 <20260812161340.2417322-17-vdonnefort@google.com>
 <20260812171148.D9E9F1F00A3E@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260812171148.D9E9F1F00A3E@smtp.kernel.org>

On Wed, Aug 12, 2026 at 05:11:48PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] User-controllable command-line arguments inappropriately trigger a WARN_ON().
> --
> 
> --- Patch [16]: [PATCH v5 16/18] tracing/remotes: Add trace_remote cmdline options ---
> commit 473129b2ec6ced6d4d23093ce86b83497f7202d2
> Author: Vincent Donnefort <vdonnefort@google.com>
> 
> tracing/remotes: Add trace_remote cmdline options
> 
> This commit adds a trace_remote= boot command-line option to configure a
> trace remote upon registration. It enables configuring various options like
> buffer size, polling interval, and activating specific tracing events.
> 
> > diff --git a/kernel/trace/trace_remote.c b/kernel/trace/trace_remote.c
> > index b1c75666ab638..8764d0ed39097 100644
> > --- a/kernel/trace/trace_remote.c
> > +++ b/kernel/trace/trace_remote.c
> 
> [ ... ]
> 
> > @@ -1169,6 +1171,124 @@ static int poll_ms_show(struct seq_file *s, void *unused)
> 
> [ ... ]
> 
> > +static void trace_remote_apply_cmdline_opts(struct trace_remote *remote, char *cmdline)
> > +{
> 
> [ ... ]
> 
> > +		} else if (!strncmp(opt, "buf_size=", 9)) {
> > +			/* buf_size can only be applied if the buffer is unloaded */
> > +			if (!WARN_ON(trace_remote_loaded(remote)))
> > +				remote->trace_buffer_size = memparse(opt + 9, NULL);
> 
> [Severity: Medium]
> Should this be a pr_warn() instead of a WARN_ON()?
> 
> If the bootloader passes multiple trace_remote= parameters, and an earlier
> parameter enables events (which loads the buffer) before a later parameter
> tries to set buf_size= for the same remote, this check will fail and emit a
> warning.
> 
> Because WARN_ON() is used here, a simple typo or misordered boot command line 
> will trigger a splat and cause a kernel panic during boot on any system 
> configured with panic_on_warn.
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260812161340.2417322-1-vdonnefort@google.com?part=16

pr_warn() sounds good

-- 
Vincent
