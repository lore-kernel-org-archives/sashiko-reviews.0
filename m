Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F97A4F30D5
	for <sashiko-reviews@lists.linux.dev>; Wed, 23 Sep 2026 16:08:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790179694; cv=pass; b=baeTPs0yUjoi7EKBxEb8QVb9LvM8kVVgjQUIIPaeahfQP/EuVdGXZs/TGf/fD2Ykq0LxEA5neDDbAjAdogNcfMUjLXJLeZ9qyx7HILScgRzKLp8QYLFx6+jHvycnYrXGrblZ2u0ajfScJ4YAF1oxidFesXI7H5UN9yilj4JDsjg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790179694; c=relaxed/simple;
	bh=otTxnRwSEe2Cg65KBPvgnCXx+Qa+TzM40oDmSLpRi+A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RuzA1Svwc9E1ytX95CJTR5vWDc2H8HtO/J/BJ2x5r6ioOIpchImr2WtsTRcEHNxRv2eqsAImm0m6Ehch/UtwsQEHRHVMSHNtkufSnJmKPkRVf/2RZetIneRcXNjQYGBcWbPhjAdqj6lm1xSmgk5uqzrhC4H8TKOENmgpP8ffsyA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=wiTCQ4+i; arc=pass smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="wiTCQ4+i"
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-52faa58bff5so276131cf.0
        for <sashiko-reviews@lists.linux.dev>; Wed, 23 Sep 2026 09:08:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790179692; cv=none;
        d=google.com; s=arc-20260327;
        b=oxuEqJrj8GoRg9sf5Ei0MRfDGnmeqMUX63rzS5pN8auJs9MNaAXP0dPQAD8y1E//8/
         SzZH6vAaeuwKGtd7opxippI6BWkW3sRHyzsgL5vRllUhif6BFp4MWsMIZ2/9l3C7aGBb
         HPhL47U3F/01mLQZzvBc9zkhDiLX9p9+ywptXCH3j7bykPd6ui48e+h7gDi6YE3obKfc
         qYzu3rEJwFDZ0FI0+MQTZTgUQr9OaY5w7vBUQD6hZupsEoKrYxrfmkLNJLVwpa9w5Lzs
         9S+3knsyvz4fOb5QrenIw8hd/AiyBiDLKwbXvizmOBp2tNg0l5HkD5i1SQtOOqvs7HXD
         w5jA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Njf5cVebfts0c9IxXjwiEMkJJZX/u05wOCxpZr/+PhM=;
        fh=0zVHGC//SC94CWFKHtFt4lnskmkXkJNNy7lE0FDd3Ck=;
        b=HOMMM/wihomgn1vcnpXCIyh2BQJaTPXlIAYYIehCPWj/fAfaRFBDZIxM8Nfg3ty2Tg
         5wsQTimefAmyZpdV28aWNc7GaT49ZPtOD7USbzuRI1NaTsrugsc7U725z5MKU0SrVY0P
         U5DhXWn+A+zYUbNAZM75pJNOTNrMUltYa88oHg9hwucCIDfBNYXjJ/LvopW2OVa78wSm
         3hmxwArpTr2FJ0mlrPgFHlbqZuSG2sKd0xivulUEoNDAVepkWB8OdVFw61tTQ+xQIwPn
         4jJR5CwMnd1A7/PAautnd+PclZ3JKqnyupluzUi2DApoviz2zZ/jRD58oOScMW0w1YtL
         oRgg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790179692; x=1790784492; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Njf5cVebfts0c9IxXjwiEMkJJZX/u05wOCxpZr/+PhM=;
        b=wiTCQ4+iWIb66F9YvPaZbDa13Jfm29mIvu0IcZjBUzfKRw1fYT29GKwWkt2ver2wS7
         OMtYAmphU2D0W69S8+7cmhV+/u7zj4L1dBscwr2KKBaw0Rlfrv96gPLvQfqmmHrVKTcI
         4jZEBrhdO0F6mUUonKercJ0FuihEWKoi3w4Rz5Qsh2HS4zF8DUIz3HWTi3b6ADpo/vWD
         eyVJoD5iwAKZwkVBzIMdl7S3dJI5TU5GQPOn5oxxZR/UMQ98L/DaC+KAlR59/V45KjuW
         Q7UbcF0w0CNh7soduJOD3TXdJ03N3RXzAeHP8cj8PcQNbILXzKR8hUdveBAmZqTXpx3V
         NGLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790179692; x=1790784492;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Njf5cVebfts0c9IxXjwiEMkJJZX/u05wOCxpZr/+PhM=;
        b=vkxy+6+qYlXRg2lNHCYbN8RKeX6+7uVG5rkO6OEms7LPdZOYwB5ydRNVJjvMaywFpd
         BdQ3Xtg7jctwLHB4FzDhzuKbzExquxZW0UWYvgk299gbVFSgsC28r0nCKXAEgLq/fbA3
         8y6CKLmTsACDI23dllEXV3Fo7p3mT8RnZyuhS6diyZ+BKI1RxJK+Yfd2fSCz7e+GenPF
         0uhm4v+2zaLZPIp+ObRmqAPG47Qy43uVNbqJxhIpMGqpiwIpjb72JBLEmX0s4bUBET8h
         mB6A2tUmzaSyXtUbSRj/qCbCszqXxseRCgOzeEnmVoOzpmkdYtCN7ovpgyAkgnWtbL+a
         5Pxw==
X-Gm-Message-State: AFuF++lO2MtkbEcNW04AN65KBlWEUQ6F7mCV+Wq3MMs3yzcChMz3wNzu
	oBzyRSkSeTIcgV+SxjFARhGgwGgD6dx4ZrPfi0SQdwMputyeMx4d9E3FnQS8j5/Ha8VwAsVT8HG
	guKS/3VKywfrwrUmPeE685mlTljfv+f2VaUSE/fzhQrlhIRh5RvX4cQts
X-Gm-Gg: AYBFou2JOPM7rsX5bfdlDqjfgLL3wn0dm9vvCmwgd7aWZzam183L6TCxpw6Tl1N1pTu
	DjF+u99xdzterdRoDNLvCWFRW8ERdIpBeyo6pgaDggSTW7zb7BoQrKK8Efqs8Zhqs5VT1B6/yr/
	vURLzUQUf9KGxVRqKUf82nEc1p3kACBHmwcCX8+XmSMhefkEd6lQfaNoPD/F0fSwsFz88ATdfKY
	CxE/Q9AU5pHjuyGIUw3F6wow80TgtIOyvfESRbEPErrt9sF8/bwOcMTB6+FVeAJ5DCpmntwKPT1
	bliOGk30qtioHLuU3hOlH49X2ATgC3UOJ+WMAuOal6UGll+ywIJRPk+e2F6c4A09PN3q51X3BTT
	afsaiglqaug==
X-Received: by 2002:ac8:5f88:0:b0:50f:af60:3496 with SMTP id
 d75a77b69052e-532f9b3b9b2mr443451cf.1.1790179691149; Wed, 23 Sep 2026
 09:08:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1790145937.git.irogers@google.com> <f5bac55bce2ca58eec592de327907d7bd3aa61e6.1790145937.git.irogers@google.com>
 <20260923072932.0FE251F000FF@smtp.kernel.org>
In-Reply-To: <20260923072932.0FE251F000FF@smtp.kernel.org>
From: Ian Rogers <irogers@google.com>
Date: Wed, 23 Sep 2026 09:07:56 -0700
X-Gm-Features: AclHuK81oTR9yTfsrrhThSo8unEPr6qEIby2LXnssjQiYl4RLnyvHbJdeMeyqnA
Message-ID: <CAP-5=fVnWC7quFZGrdX_q7yFdutT_Nt4vm+rVknPrF=xaFsnNw@mail.gmail.com>
Subject: Re: [PATCH v5 14/23] perf trace: Enumerate the target again once BPF
 is attached
To: sashiko-reviews@lists.linux.dev
Cc: linux-perf-users@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 23, 2026 at 12:29=E2=80=AFAM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Medium] perf trace: invalid procfs path in pid_list__add_children miss=
es child threads' descendants
> --
>
> commit 1823e747d15e463dac6663bf4d27392bbba3f047
> Author: Ian Rogers <irogers@google.com>
>
> perf trace: Enumerate the target again once BPF is attached
>
> This commit adds logic to re-enumerate target tasks from procfs after BPF
> programs are attached. This ensures that any tasks created during the
> startup window, between the initial enumeration and BPF attachment, are
> not missed by the tracing session.
>
> > diff --git a/tools/perf/builtin-trace.c b/tools/perf/builtin-trace.c
> > index ddbe1c8ec1dd4..6b52f0d408dd4 100644
> > --- a/tools/perf/builtin-trace.c
> > +++ b/tools/perf/builtin-trace.c
>
> [ ... ]
>
> > @@ -4691,6 +4696,247 @@ static int trace__set_filter_pids(struct trace =
*trace)
> >       return err;
> >  }
>
> [ ... ]
>
> > +/*
> > + * Append the tasks tid has forked to tgids.
> > + *
> > + * task->children holds what a task forked, and a forked task leads a =
thread
> > + * group of its own, so each is something to expand in turn. New threa=
ds are
> > + * not listed: copy_process() gives a CLONE_THREAD child the real_pare=
nt of
> > + * its creator rather than the creator itself, so a thread is a siblin=
g of the
> > + * task that created it. Those are enumerated from the task directory =
instead.
> > + */
> > +static int pid_list__add_children(struct pid_list *tgids, pid_t tid)
> > +{
> > +     char path[PATH_MAX];
> > +     pid_t child;
> > +     FILE *fp;
> > +     int err =3D 0;
> > +
> > +     scnprintf(path, sizeof(path), "%s/%d/task/%d/children",
> > +               procfs__mountpoint(), tid, tid);
>
> [Severity: Medium]
> Does this construct an invalid procfs path by using the thread ID (TID) i=
n
> place of the thread group leader (TGID) at the root level?
>
> Since Linux procfs only exposes thread group leaders at the root level,
> a non-main thread's TID will not have a corresponding /proc/<TID> directo=
ry.
> This can cause fopen() to silently fail with ENOENT when
> pid_list__add_children() is called for non-main threads.
>
> Could this result in entirely missing the descendants forked by non-main
> threads during the startup window when using -t with a child thread or
> expanding a process group?

So readdir won't show threads in /proc but the opening /proc/<TID>
does work, which is somewhat obscure. The code must be this way to
work for children forked by threads other than the main thread, as the
TGID+TID lookup would fail for them.

Thanks,
Ian

> > +     fp =3D fopen(path, "r");
> > +     /*
> > +      * Absent if the task exited, and on a kernel built without
> > +      * CONFIG_PROC_CHILDREN. Neither is worth failing for: what is mi=
ssed
> > +      * is a task that has gone away, or descendants the kernel will n=
ot
> > +      * name.
> > +      */
> > +     if (fp =3D=3D NULL)
> > +             return 0;
> > +
> > +     while (fscanf(fp, "%d", &child) =3D=3D 1) {
> > +             err =3D pid_list__add(tgids, child);
> > +             if (err)
> > +                     break;
> > +     }
> > +
> > +     fclose(fp);
> > +     return err;
> > +}
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1790145937.=
git.irogers@google.com?part=3D14
