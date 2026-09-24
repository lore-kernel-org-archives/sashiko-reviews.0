Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 465FA370AC6
	for <sashiko-reviews@lists.linux.dev>; Thu, 24 Sep 2026 12:49:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790254186; cv=none; b=VBIHtH3QzAkojeLP+MbJkK5CQ/goJfggUgx9w5SWdKMye8UhLp59OZuqfMLiHPHKVjGqqfnPJn1RIOR32wAwaX5Y1MbBtzr8AhEaIgSYdbEqAKfrYe2IDMG6ZTGPjqlY0bhUpMh5cy2pVjkh+bw12merSA+4vV2bSxWyJsqILz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790254186; c=relaxed/simple;
	bh=E1XqDfdt3OjDrHfrS8ttN1cHp4hIDV/ezswXPVSmuzk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SEzeq1TdqIiEUkbCH6f93Bq+TiC5suNmXn+ON+lB45yFA1IeymoNSWCFwrumH9GjQzCaq3np4+pcwPYlnKHoNRcf/DThvgvToHNjeX5dx8ipqOrTUr60XNZTTqbt0b1P9/gmurT1EAtgqwikEYAtA6/b9zgviJ2cmZ8GP3ZZvz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=cdho0JhQ; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="cdho0JhQ"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49d1fb0cf5eso14833125e9.3
        for <sashiko-reviews@lists.linux.dev>; Thu, 24 Sep 2026 05:49:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790254183; x=1790858983; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=fTViH/28rpU6lxn4+eKFogmj0p5WIz5+TiBeTOUOlBA=;
        b=cdho0JhQy7m6MIG8XnffHnUca3IvmYgL+wHNant6nXSMoVZE8TyBsw8GlThN2S2BVI
         /fBlW6Ij17lB8R1fv1w6dbbnXiBUztPfeEevwKiHt0iQ/OpU6qLlczqot1m807+iYxkY
         sRnCbd0XFHwDuL9iT6pKOoMmyHKGRFu4wzuqfkk50bdM++hUekECpq3TjjAO6CFs/siY
         mNk4FtxO9vSJrNSbhf9z3VurqYepCJMf+VY5sQ8VRrM2FVzNZFVgNgECTUTsNbTzxBlH
         WkIh12Ykna1ILMFVi7TpIZ/DMopss8WutrIqJB8+PdgNf2CJi46qhg4tQGLLMZAR3ald
         vo2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790254183; x=1790858983;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=fTViH/28rpU6lxn4+eKFogmj0p5WIz5+TiBeTOUOlBA=;
        b=h+wzFS+4+zjixVsDrv8oa4i6gyEy+QPJE7KnDPffOJ89Xc9aa7xq0hlkVRTai7fK7I
         VxY6rIyQHj1Qy5uHeN//w69UOZM8tskUxrYxbNA08Bp+gqjkm7Qwcf+Sf/sZTUmc3sWJ
         XcmOJskXhiOPTVnMrJRCRupxi65bIBZDs9WrnISqZs0gfB3JLxQaXbOMIiPXLeG4ZAWa
         k2B3YCm7s0IMiS3FD1METa0MtZ2VLQs7pMhloZKmMCz8ZKdnj1fPaVlupk0FKXCRKw5c
         oJq97/ZcjYrRq3ESJ1oL9XywiswdIXNMQVzETBpEFR4D1GUBWugR+S8bnK18cn/ukSa8
         QpjA==
X-Gm-Message-State: AFuF++m3qTH8Q6TKjaGI55GDp4D2VM5VxpAiOtgni7q8KS0wQfhabaXV
	mTz9TMMegMuQL4qcSomR4JsGle6DJkLx1zYeHfRXsztqK2w5ztIaRCBqC/j+a6sUWse5JDOKbdY
	6AiHATA==
X-Gm-Gg: AYBFou3kUAJdfrLau3d/YSBiXOpKaoZl6tuLi/wwHxBTxFwoL7SHUc8uekyMe6rGGL4
	9zhX0TnMep5Fh8av7oEMUKx2bdmg9UXD3gtatyAZ+etZxVcYmCwtqtoRvY/BVbjpFV3ldmZ2B+l
	t70zkxui3rVXbGLM5r5gxqbnANo1ZWQYGQ5xD/UevtMX+hyoIIdJIW0J1E9lF7iAEMrMoE77ckz
	ZPw3b6XyWhaniI3vjAQLpTvwukCSmwA29tRPWlEsuuiLsDQ5lMezR0yAU445steDuj82q62xH41
	6yo2BcwLDDfBvGR2+i4DqJ79ato5hfnmtpJ+1fK/s7A02sydsISla6xDkYE91qzCtXHss2UZxG5
	JAq9aXoeRqGeMM25R6Z/gT9iBaCxGol0bDIC78vffpKTCiQY/GWcEbyLEAXM+CHFyJQ8PhzwhWJ
	RhhuVKi9orWv9YK4ADbluE871yQ67nBYz/Pph46Cbwhvir7Qihzdj/MZ9O6vyuuK4i0XXQupJEJ
	/Gg0EJGk/cWPz+01Qn3cnRAyyDV2buoiSNAEK99Ei0=
X-Received: by 2002:a05:600c:198a:b0:499:b65e:49c9 with SMTP id 5b1f17b1804b1-49fe66d2d24mr43567915e9.10.1790254182845;
        Thu, 24 Sep 2026 05:49:42 -0700 (PDT)
Received: from google.com (135.91.155.104.bc.googleusercontent.com. [104.155.91.135])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe5debbf4sm78220995e9.9.2026.09.24.05.49.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 05:49:42 -0700 (PDT)
Date: Thu, 24 Sep 2026 13:49:38 +0100
From: Vincent Donnefort <vdonnefort@google.com>
To: sashiko-reviews@lists.linux.dev
Cc: linux-trace-kernel@vger.kernel.org
Subject: Re: [PATCH v6 07/18] tracing/remotes: selftests: Add a test for the
 dmesg tracefs file
Message-ID: <arUcYmwpk6Jo-_nL@google.com>
References: <20260817135517.3919534-1-vdonnefort@google.com>
 <20260817135517.3919534-8-vdonnefort@google.com>
 <20260817140514.DE67B1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260817140514.DE67B1F00A3A@smtp.kernel.org>

On Mon, Aug 17, 2026 at 02:05:14PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [Medium] Unconditional write to the newly introduced `dmesg` tracefs file in `setup_remote()` breaks existing remote tests on older kernels lacking this feature.
> - [Medium] The dmesg test implicitly depends on dmesg timestamps and silently fails if they are disabled.
> --
> 
> --- Patch [7]: [PATCH v6 07/18] tracing/remotes: selftests: Add a test for the dmesg tracefs file ---
> commit f74a3f691a6b4375c6156c109a1d6336670de341
> Author: Vincent Donnefort <vdonnefort@google.com>
> 
> tracing/remotes: selftests: Add a test for the dmesg tracefs file
> 
> This commit adds a new selftest to exercise the newly introduced dmesg
> tracefs file. It checks the ability to turn on and off dmesg redirection.
> 
> > diff --git a/tools/testing/selftests/ftrace/test.d/remotes/dmesg.tc b/tools/testing/selftests/ftrace/test.d/remotes/dmesg.tc
> > new file mode 100644
> > index 0000000000000..74f801a5e39ea
> > --- /dev/null
> > +++ b/tools/testing/selftests/ftrace/test.d/remotes/dmesg.tc
> 
> [ ... ]
> 
> > +    sleep 1
> > +    output=$(mktemp $TMPDIR/remote_test.XXXXXX)
> > +    dmesg | awk -v ts=$last_ts '
> > +    /^\[ *[0-9]+\.[0-9]+\]/ {
> > +        t=$0; sub(/^\[[ \t]*/, "", t); sub(/].*/, "", t);
> > +        if (t+0 > ts+0) print $0
> > +    }' | grep "selftest id=" | sed 's/^[^]]*] //'> $output
> 
> [Severity: Medium]
> Does this implicitly depend on dmesg timestamps being enabled?
> 
> If the kernel is configured with CONFIG_PRINTK_TIME=n, or if the user-space
> dmesg utility suppresses timestamps by default, the output won't have the
> [ X.Y] prefix.
> 
> The awk script strictly expects this format and drops lines that do not
> match the prefix. This would result in an empty temporary file. Because
> the script executes with set -e, an empty file might cause the subsequent
> check_trace validation to abort the test.

I guess I could check for /sys/module/printk/parameters/time ... 

> 
> [ ... ]
> 
> > diff --git a/tools/testing/selftests/ftrace/test.d/remotes/functions b/tools/testing/selftests/ftrace/test.d/remotes/functions
> > index 05224fac3653d..4a14aa72fdf09 100644
> > --- a/tools/testing/selftests/ftrace/test.d/remotes/functions
> > +++ b/tools/testing/selftests/ftrace/test.d/remotes/functions
> > @@ -8,6 +8,7 @@ setup_remote()
> >  
> >  	cd remotes/$name/
> >  	echo 0 > tracing_on
> > +	echo 0 > dmesg
> 
> [Severity: Medium]
> Will this unconditional write break existing remote tests when run on older
> kernels?
> 
> Since this test suite frequently runs with set -e enabled in the caller
> scripts, if the dmesg tracefs file does not exist on an older kernel, this
> echo command will fail with a "No such file or directory" error and abort
> the script.
> 
> Could we check if the dmesg file exists before attempting to write to it?
> 
> >  	clear_trace
> >  	echo 7 > buffer_size_kb
> >  	echo 0 > events/enable
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260817135517.3919534-1-vdonnefort@google.com?part=7

-- 
Vincent
