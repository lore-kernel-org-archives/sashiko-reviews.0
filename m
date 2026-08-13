Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D571947AF42
	for <sashiko-reviews@lists.linux.dev>; Thu, 13 Aug 2026 14:06:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786629985; cv=none; b=frtsWTLjcLvmEbl/3XWonTfhF7ZsHegQJyI1NEyTEvmd875gsuO3icKkqJs+Bmsq2hfO2NUVNWCN5eOf8W4ToUUbE2K/v/56IDL7MyFWPjsTRG2ef7Xzfz7iVQJLFPGja/sAHO3l+jNclL6+YDz1qAdpt9KIwEQT0xYahHQvnFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786629985; c=relaxed/simple;
	bh=RCsaeHJjOL3eThI9TyXhwUDgnmspmgSKZrl0n0eh+Uc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P5IiZXn+bRcnfZ2yjPVJjbF7L+M6u13LOCM0wbiVB0Xx+5Dk3e5jvQwyMvNWkYkqKOYn8+6J1sLgCXgSPS6PPfxY7GpbZcgqrybG6yFZmdJvv/ad7BK9fv023s8nHbWHSWuRSWhrKHLakxVYyE/ku25ark66L0gbX/Tce79gjeg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=lTxSbVGr; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="lTxSbVGr"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-47f96c5b722so1174681f8f.0
        for <sashiko-reviews@lists.linux.dev>; Thu, 13 Aug 2026 07:06:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786629981; x=1787234781; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=7RWFekVfVDh1uRsmRT6ByR+FlOG/JDoV1UHXYpOqNio=;
        b=lTxSbVGrgsbwEavBg5P7vixJjAD+ZY7dP5eHlELM5xhPj5unZQKjtoQMTy9Z6gBMIj
         OKR4dhBGMTBzxoLZLkvkTo2n6GYab6+ou5QuK4MxwV9vRz0YgxJYtAI0cEKWDdVqGV64
         bVfwFp8rF+zXp/viNN3sPjt1GtWTc2/0yjX0ySFKDiMPScCWmYsFKyPkoMWwRhIoLnoz
         ShiW/thCBW7Mb7TgVhEJD84nQms/BN17ohJDn8r2tgtObpEaMaaLB6n3VNmu3qGcvh0G
         ovA2JbPtI4W8VfhlGG5c0yXpbVGBnUrY5uhCe1Fpf/kfv3xzaqG4EQuDjKzK3A57uISO
         cSAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786629981; x=1787234781;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=7RWFekVfVDh1uRsmRT6ByR+FlOG/JDoV1UHXYpOqNio=;
        b=rwib9JoaaJwRXfWoOIDqTG0bTkmb1gCs11pwmab/5OP5hqz3OVdC8MQNf/oVbQXStv
         F2qJYmmyRiDkAoXpjL4upkG62EtetCiKuoucGrKY+7YSjjuilsGF3wS9b5qgLWcIOW19
         1XZIzy/RE/n0UvMpR/0HmXSonnktk/enO0wN1KZLoFJvJ2urlpoW2PIKs4q0dpI+1rNP
         e839U9Rjj5vSrQzkRpl54nbp5yCUdmc45Ih4tbXZc/0MlHgCdYnN8B8WtLGcemUOADRs
         EzMwdF6SqyZeG2GU0Rz+VwvO4UX14Tsh85GW4fqtX+O0D3b5OmcdaoBbAClvEXDF/nP7
         rnQw==
X-Gm-Message-State: AOJu0YzpD4HXvxk6frdZ17qudlwmPpj/YZwCmEuGviwg6ISHGtXEE7oK
	LCkJ509lNaHBozVYqWywa+W0xztZigkK6jjVicxaMahrec15M77CBajzQpRdmObFVn5GpEuN2GR
	VcKfwUQ==
X-Gm-Gg: AR+sD12YQzn3oZ1q5XJ8UbY1bMtK/nFwv39dyTyWxNjZBPwciabBL2KiD/4eTa+jrCm
	gW1isHh0B6l6ojfnOZFqMyV09nh2anAW4wmOhp6CKmHw1dHKjvVj11PA9ANs9Y6E2vYUim6Of40
	QLnC0c1XM3OOHwer+NZpKPP6K3MRnHdlWyTT5DfmakRQpMYx+KmXIDqoqQ159J4YK6jNiR8evTf
	t6o+6hmOU1//mRX/AxfIsyxuLeovw4zmmFEqZp1Qh2/XOUZ+QYSMOY2rScd/hYiHNsA4zq0S7Ov
	l1Kz1HgLWJSLTcQujJh3bK930MTCV1x0/gwz0fDlooApw7jlsECfyA3rPbRq7MYhZBg7ZrOwxuW
	BIPMEMx4xGykPw8Tr2wkjF+OhdrEmiKJ6Z2ixos4HCmWGRVYvRCx96lgn0HzmLxSPl/MEhMcfFw
	+B6A1622Zihn8bxwMTFaodFoQrc2LsBOSVDNey6y3vY4H+Bq7v7K9Zk+R0lx5JGiK789WkO0Qc1
	jY0vLgD5M8vJM3wS7mFC5iBJOIYDf8q
X-Received: by 2002:a05:6000:25e7:b0:47f:fe45:e597 with SMTP id ffacd0b85a97d-48159ca60e6mr9068872f8f.3.1786629980214;
        Thu, 13 Aug 2026 07:06:20 -0700 (PDT)
Received: from google.com (135.91.155.104.bc.googleusercontent.com. [104.155.91.135])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4815a56981csm6901323f8f.10.2026.08.13.07.06.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 07:06:19 -0700 (PDT)
Date: Thu, 13 Aug 2026 15:06:15 +0100
From: Vincent Donnefort <vdonnefort@google.com>
To: sashiko-reviews@lists.linux.dev
Cc: linux-trace-kernel@vger.kernel.org
Subject: Re: [PATCH v5 07/18] tracing/remotes: selftests: Add a test for the
 dmesg tracefs file
Message-ID: <an3PV-9CVSSj1eyb@google.com>
References: <20260812161340.2417322-1-vdonnefort@google.com>
 <20260812161340.2417322-8-vdonnefort@google.com>
 <20260812164040.19F761F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260812164040.19F761F000E9@smtp.kernel.org>

On Wed, Aug 12, 2026 at 04:40:39PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 4 potential issue(s) to consider:
> - [Medium] The test script leaks a temporary file in `/tmp/` if the test aborts due to a failure (e.g., when a command fails under `set -e`).
> - [Medium] Unconditional write to the new `dmesg` tracefs file breaks the entire remote trace test suite on older kernels.
> - [Medium] The new `dmesg.tc` script lacks the necessary `# requires:` header for the `dmesg` tracefs file, causing it to fail instead of being skipped on older kernels.
> - [Low] The awk regular expression for matching dmesg timestamps contains an unescaped bracket, unintentionally creating a character class.
> --
> 
> --- Patch [7]: [PATCH v5 07/18] tracing/remotes: selftests: Add a test for the dmesg tracefs file ---
> commit bd86167985384496571cc5a8f03ca97dd77d76fd
> Author: Vincent Donnefort <vdonnefort@google.com>
> 
> tracing/remotes: selftests: Add a test for the dmesg tracefs file
>     
> Exercise the newly introduced dmesg tracefs file that turns on and off
> the dmesg redirection.
> 
> > diff --git a/tools/testing/selftests/ftrace/test.d/remotes/dmesg.tc b/tools/testing/selftests/ftrace/test.d/remotes/dmesg.tc
> > new file mode 100644
> > index 0000000000000..9d389f9d0fb78
> > --- /dev/null
> > +++ b/tools/testing/selftests/ftrace/test.d/remotes/dmesg.tc
> > @@ -0,0 +1,81 @@
> > +#!/bin/sh
> > +# SPDX-License-Identifier: GPL-2.0
> > +# description: Test trace remote dmesg redirection
> > +# requires: remotes/test
> 
> [Severity: Medium]
> Does this script also need a "# requires: remotes/test/dmesg" declaration?
> 
> Without this explicit dependency, running the test on an older kernel that
> lacks the dmesg tracefs file will cause it to fail abruptly due to set -e,
> rather than gracefully skipping it as unsupported.
> 
> [ ... ]
> 
> > +    nr_events=128
> > +    for i in $(seq 1 $nr_events); do
> > +        echo $i > write_event
> > +    done
> > +
> > +    sleep 1
> > +    output=$(mktemp /tmp/remote_test.XXXXXX)
> 
> [Severity: Medium]
> Will this leak a temporary file in /tmp/ if the test aborts prematurely?
> 
> The script is running with set -e, so if a validation step like check_trace
> fails, it will immediately exit before reaching the rm $output command.
> 
> Should this use $TMPDIR instead, since the ftracetest framework cleans it up
> automatically?

sigh... I have s/TMPDIR/tmp/ temporarily (pun unintended) to debug the script... 

I'll fix that!

> 
> > +    dmesg | awk -v ts=$last_ts '
> > +    /^[ *[0-9]+\.[0-9]+\]/ {
> 
> [Severity: Low]
> Does this regular expression match the bracket as intended?
> 
> By failing to escape the first bracket (^[), this creates a character class
> that matches spaces, asterisks, brackets, or digits instead of a literal
> opening bracket.
> 
> Could this be properly escaped as /^\[ *[0-9]+\.[0-9]+\]/ ?

Sure, I can escape "["

-- 
Vincent

> 
> > +        t=$0; sub(/^[[ \t]*/, "", t); sub(/].*/, "", t);
> > +        if (t+0 > ts+0) print $0
> > +    }' | grep "selftest id=" | sed 's/^[^]]*] //'> $output
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
> Does this unconditional write break the test suite on older kernels?
> 
> This setup function is used by all remote selftests. If the dmesg file does
> not exist, this echo will fail. Since the test scripts operate with set -e,
> this failure will cause the entire suite to crash on unsupported targets.
> 
> Could we check for the file's existence before writing to it?
> 
> >  	clear_trace
> >  	echo 7 > buffer_size_kb
> >  	echo 0 > events/enable
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260812161340.2417322-1-vdonnefort@google.com?part=7
