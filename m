Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com [209.85.222.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03FC24508E0
	for <sashiko-reviews@lists.linux.dev>; Mon, 18 May 2026 12:54:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779108875; cv=none; b=WtDcEh9hI5iUG9XoYkwZKrxGmT7TwhFIbj509+zbJ+MKrd8wbCGUQul5ecO+jM0nQ4W66gTLzf25umq+LvGaule9lF+EkbARskXO4Zk0YiQhxv8sI+Tzo5raiS04Pft84esY2ZVCYYyQx8z6jLtNcNgu/QH0MvsrZpFQjCF6nYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779108875; c=relaxed/simple;
	bh=kzq6fXO5xH0JFrRrfpeplkkfdRb3ESDVhUgoGp4aY8A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oF1Zmj+0cG0DMlOsZ5kMVwZGbNa3zk8033vO4FoHijp8RUSGZO0/AoW374djXNojR/6LkzKkBCTLAS2MKuqax5NDpLscTuKTsHMDgtWIwJaVg+aadKojPMDW4bDFLzRHprQlcpDTMks5dMLYtRAdsbfo/kr/+kwPHLL6WmTiTJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-95fa7cd1392so1938798241.2
        for <sashiko-reviews@lists.linux.dev>; Mon, 18 May 2026 05:54:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779108873; x=1779713673;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kXfE2Lz48kTNKntKaUoznm2p2xW5+qum7mp86cRTvX8=;
        b=Z2joce6ybeaaosfPQ1bu6/ccF0JW5ief/osqBGs2QGD5iBAbWNBbzxbvWAJoL17AXu
         iFfm5ZrL0hPDx2063nka9ihbBMb+41EPOlL4VNfnQJ0eb/MLO+NZfmFP60jbxbdCkEej
         IfiGbmtO/0Ee7gZL/SjFVQG5FHzw6R+IdG1xdWgO8ZeX2cNJh5wYcZoTLbtWP4DHeCIh
         kK5pb9xq+G6pWBiMHGddx20F7xNiUdCfPfAGSrg2niwX9qglMFAlqbGBz074ZlT5OH8R
         Fs/Fr/G1CVpW/GXtD/caiWQeYh9A37YiXPGUCDKFq9tuhQLlJNWSIgGxzHCst/bHqZt2
         roaQ==
X-Forwarded-Encrypted: i=1; AFNElJ9KYN7LJIoD4GfFZMamGIpo5njzB8CDgjJsFug5xgThOKk21L+JgNaMaIwV/lVwNQN/uuDRENZ+hqP6h77ypfA=@lists.linux.dev
X-Gm-Message-State: AOJu0YyKCRCJRubGL0wtErnwXFkds+M0QcyeZX4NaV72K/cy/SnfcOo5
	cjLt9pwpzUWBv71Lc8VPH79TMvCil50x/9pgOmQxbKwNNpuqCbBhvhGXLAa40AL4
X-Gm-Gg: Acq92OGPHYOeFXLBa+LFC0pUpDOBUOQf4gk5ygBiQGgFWB0Yo4n9Y4VcwDn/ynTFuXk
	wbEPIFpdobhPRrs94QrZ6fo3AGh41FDAKorlAYvUZH9uMkyZ/GeCWE9gvAzsVbrbyKlD7OhxA66
	aNY59vB+2o/bGcNsa5YPj8CNe9BoiNAhfCIGW9JvsYmoMWL0stVdTxUFvzkh1Eze6qj73386Z19
	XODf8ygSQtmqC7DkOqY5e0sob42nYNrLoz3ad3AI8lj+Dw2KPoguZMwJB3kAu/5CgktkInAjLNi
	se3Z8p+XPDYX4+mA/wS1BLetrpHunpiHVGczR92b91Vy0ocTC4a7ekzEMuiRz2uCrQsTaFl/TnV
	S7csk7mHsDIS3kxveSK/QSyfsz035oW+62rEUgZVxlxSOODiP1gKn17LGX39kwgFS3vzXEQSeB6
	QuifO4kN3GSw99C5uPbj1PPz8RQ6WeAvU1ZIDu6B2yX9FF4bS1/uXnCOWSMjXd
X-Received: by 2002:a05:6102:946:b0:631:ab8b:c348 with SMTP id ada2fe7eead31-63a3cf12325mr7789544137.8.1779108872862;
        Mon, 18 May 2026 05:54:32 -0700 (PDT)
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com. [209.85.217.42])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-63ccf18cfc4sm4558888137.2.2026.05.18.05.54.28
        for <sashiko-reviews@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 May 2026 05:54:29 -0700 (PDT)
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-63169437ac7so1801088137.1
        for <sashiko-reviews@lists.linux.dev>; Mon, 18 May 2026 05:54:28 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ81jnk7+qhZ4pYliQETxNlyKAS9jFOXtEhjDq/rZhsWeiQHjygqUGR2RnljyyWKFbhuuL5Gp8hi94VBV8g6ovk=@lists.linux.dev
X-Received: by 2002:a05:6102:946:b0:631:ab8b:c348 with SMTP id
 ada2fe7eead31-63a3cf12325mr7789460137.8.1779108868589; Mon, 18 May 2026
 05:54:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <4f3d7f48-5766-425b-91f6-0acdb5554584@kernel.org>
 <07602616-412B-4ED8-95D7-588C0D077EE3@linux.dev> <2e20badf27b6910d619329841e37d2961556056f@intel.com>
 <20260518121601.GA87957@macsyma-wired.lan>
In-Reply-To: <20260518121601.GA87957@macsyma-wired.lan>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 18 May 2026 14:54:17 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXKONz_jCAedOWQ7Oqza8DDXt5hBqB1ZvO-1s2pvwsbUw@mail.gmail.com>
X-Gm-Features: AVHnY4JEQspflVlWQjqPB-ZT9trO0h2lQBDWUevKp9TlFoxeoXF1KrY6M5cCx8Q
Message-ID: <CAMuHMdXKONz_jCAedOWQ7Oqza8DDXt5hBqB1ZvO-1s2pvwsbUw@mail.gmail.com>
Subject: Re: Stop false review statements
To: Theodore Tso <tytso@mit.edu>
Cc: Jani Nikula <jani.nikula@intel.com>, Roman Gushchin <roman.gushchin@linux.dev>, 
	Krzysztof Kozlowski <krzk@kernel.org>, debarbos@redhat.com, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Greg KH <gregkh@linuxfoundation.org>, 
	Konstantin Ryabitsev <mricon@kernel.org>, Guenter Roeck <linux@roeck-us.net>, sashiko-bot@kernel.org, 
	sashiko-reviews@lists.linux.dev, sashiko@lists.linux.dev, 
	Linux Kernel Workflows <workflows@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, devicetree@vger.kernel.org, kfree@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Ted,

On Mon, 18 May 2026 at 14:26, Theodore Tso <tytso@mit.edu> wrote:
> On Mon, May 18, 2026 at 11:04:29AM +0300, Jani Nikula wrote:
> > > Sashiko is supporting various LLMs, including open models - it=E2=80=
=99s just a practical
> > > choice: to my knowledge the quality of open models is not on par with=
 frontier closed
> > > models and it would require a non-trivial amount of hardware and infr=
astructure to run
> > > an open model at the required scale.
> >
> > In the context of the "Reviewed-by: Sashiko" discussion, this actually
> > makes it really hard to assess the quality of those reviews.
>
> Agreed.  There's a reason why the coding-assistants.rst specifies the
> model which is used:
>
>   Assisted-by: AGENT_NAME:MODEL_VERSION [TOOL1] [TOOL2]
>
> The problem is that (as Jon has pointed out) coding-assistants.rst was
> intended for use when the tool was beging used to help create the code
> --- that is, "Coding Assistants".  What we're doing here is more of a
> reviewer assistance.  Something like:
>
>   Scanned-by: AGENT_NAME:MODEL_VERSION [TOOL1] [TOOL2]
>
> Would be more interesting, but it doesn't actually tell us anything
> about what the results were of the scan.

Indeed.

Scanned-by: Geert Uytterhoeven <geert@linux-m68k.org>

Doesn't say much more than the RFC2822 "Receved:"-header,
and thus not meant to be saved for posterity in git history ;-)

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
