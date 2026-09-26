Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34CEE2652A2
	for <sashiko-reviews@lists.linux.dev>; Sat, 26 Sep 2026 13:46:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790430382; cv=pass; b=MaJ52AG2v9Llsky2MGJwjVt+j5LCa+jdqdZbMPs/UCDqhzdryGsKX4Mqas3t0SFo04XEbX7aAvLQkfgfgx0EW6MQyFPTjz19qoz7mzbN3ATsL6q0YZPFLh3SFENjDEPp6Zf9keQfadvPjA/h4z8FVrzwWf/vB1eYR22vBpBXueY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790430382; c=relaxed/simple;
	bh=Tx1oOOC0NfZU6KNipWxxzy84I8pBGTmceJk/A55dXM4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WrYgeOi31r99VJofTiGj+FU2uv/uMebWUBUJX4bssan1pI5lGW9WCMs4eddvL6BjB2Wdh3Sb1+zfRyeREhyrLUgSzN79fMArvjwAPd1sVe8xzo2SChEPQ9efvfHRPdgOZQYPjUcNzVlxvKkNC1QUUlxsjGsq1gfwDe8kOnRQ6BQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=fwRAHIkA; arc=pass smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="fwRAHIkA"
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-53328262efbso73001cf.0
        for <sashiko-reviews@lists.linux.dev>; Sat, 26 Sep 2026 06:46:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790430379; cv=none;
        d=google.com; s=arc-20260327;
        b=o4R1NsFHd/xp/C1o7U5z+M+47j5z9O1U3dXETV7u4j6OfaIT0Ocn+u4Q9Qy6p/EJi0
         C5crH4ApG39q3Ma8DEyCYLD8Yjjfo8jkdewEoTnIWRlWgYsYx4BaGiEhlCUPua+VnQT5
         VLi86jlqXx2jaTnQiFs4JNArpMRe2I78BuO2gUrPQTyyirlYmnrHZ0+Tl1G0cpoiGi7Q
         Vjph7MJMUJqGinFR6nQ1ErDv+kmAxs74NdwfiVpSPp4Fpv0H5Kp7vRJtTuv/bBnQPqWM
         hG7z0iP/GU82xFjVlBZCiAU8p2ZnPCbrodtitgo/rdqMFaNzPt4lSm8MdsHtkJcgSCqp
         tNjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vJLu3kDSRfbZXFyhHWOsWhCoWdaigpzzohCPc4GKQh4=;
        fh=0zVHGC//SC94CWFKHtFt4lnskmkXkJNNy7lE0FDd3Ck=;
        b=dmBDmNCqOm4kdTBKkaJwwPZPUi6E9rJIJUxOdunvcdgN8r+zySh944eAPL+gK6SoRO
         Z+gRQ1IkOr340Fz50vInx0ViqyOFz56QhN/+mkw3L0mFJPjkVQDhaYOaTQ3QNTAsYGz0
         Dn6yJi1Kd8gk+v5Tr8AOb+6nEEuKL40Vj8EXPbZNgR4WoeL44D2lYqie9U1iJzIwrXAp
         foPfS4E2EF8KFYsuckxrOILm5a+xVmZxoORZwR/tD11ng6Z31+9thCrw8I9ayewPNQOR
         2HKdRN1LgC+kti9APX3ZY1xNeF+758CgV7hid8inCXj54fC6sJE3iI4XWz0kLzXr8FsS
         gUbg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790430379; x=1791035179; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vJLu3kDSRfbZXFyhHWOsWhCoWdaigpzzohCPc4GKQh4=;
        b=fwRAHIkAbi5QpCLHhIWd/wUzGCHwVi422bAcFAyjgIp0PJlUcNDNPZ8Dl7qfIfCd45
         +5VQGaxQjYURXUKgOwjM2o4AW1ZEezvfsjEQSoQ9W7/yzsXy/Wqz4gMbgDUSJUez/wJ0
         S9xsqTVIWsmhGEdBM3VCt2GV/E3P2FMuAj8F+gJtbydNhe09RPgD8wAZIjHp4TycVQgk
         S9TbvZiSHb6/X88XxG6TZUaLs0u2ohOWN8wXS+13lZwR6MKnMXGpuksbT/sKXmsgllg4
         ZmhU627kaGTTgho7hK8S3zKbk4fyGPHvGwYjlSxx86/y6PchyBXxWA0KAvXIEtVYxn27
         bR9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790430379; x=1791035179;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vJLu3kDSRfbZXFyhHWOsWhCoWdaigpzzohCPc4GKQh4=;
        b=FpfGOZVR2moQh+zx73xZPGKOZe4q9ZbInGIrmf4GEpRG+J4gc114qMULMaV+cKrn6S
         yKyjCWsIKTilXBBRxsOFbiq1985/4+fehIW9nLMjXJ1rjL9lZ4I6F1Tk0Vnl08sd1tMc
         4k9UtqiVM7U+SQOaStIrBqn9ECuSC/Z58usgXu/uCXR4Mif8Qh+Y0PLJASXwt+riDAa3
         4nSl+LD0Jv5ZWdciGpvgs9jAiG8C9fOiZQLLs2IbLwPY3XDQYzIcj8U363zW4qwDY1C/
         vfzafbRNtquUSS8nulIinthqHRt7QXBhvgxdlCa+UIhPVKNW2ydTnIUcl55P0FyDW7TS
         zrYw==
X-Gm-Message-State: AFuF++nED9Pnuuszrbg61A9rTA72rXxMtuule0IL80lvGcozU1tzGfs3
	bLS5GwoUg1MXz9/cJeM4StU0gzOz8FLWa2sJIswBJ0/yGAHla0eKJmjUJVp0Fsj2jyql1RqByHQ
	DAkSh4JNvFTjcOy/3XCzNSwDaIcQmOfIcLhMm+1sO3CKBtIq+sA+OmN+fiHc=
X-Gm-Gg: AYBFou3GV4AwmngA/GfZT8RieTZugXSPdndpYWiTouB/84zawJsayGn62NbWoH9P3WZ
	X9pZgUi0EUnYeVZs0n72u2beMyKtm7wJgL+bRWtvdwBDoMwZMBCRiIiiVBL9HS5lZhGbbT6EIwh
	a40LbxQsWWSHyTOm6uvsop0QwxRDIGro7EoOj4dsPQJkNSGSO6PwjPl7TyC8LwhnE1xP0xk1cjS
	yF3BBEcsRGf5ulc2REIzUPfLlHb4QtnSbML3TjsRB8bOaidKpwKDmyFWyI4Mzih8ioll1cRbNRV
	+3x//ExovP/zTSPAKh9hRlTKe4R9i0iPXfBzTIPHkIpW1RkNjxKK3QY=
X-Received: by 2002:a05:622a:598c:b0:532:858d:e791 with SMTP id
 d75a77b69052e-533201552e2mr13447991cf.8.1790430378320; Sat, 26 Sep 2026
 06:46:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260923181213.3032038-1-irogers@google.com> <20260926062029.800743-1-irogers@google.com>
 <20260926062029.800743-22-irogers@google.com> <20260926063435.5FDD21F000FF@smtp.kernel.org>
In-Reply-To: <20260926063435.5FDD21F000FF@smtp.kernel.org>
From: Ian Rogers <irogers@google.com>
Date: Sat, 26 Sep 2026 06:46:06 -0700
X-Gm-Features: AclHuK8XMz-BOrz2CX67qrrrD064GgmoSWiLrW7QQhmG6NSRGgZn1LOhVzl2UbU
Message-ID: <CAP-5=fURGSJtYcs0jP+oyRZOX6w5KNRF73V-KswmzQN9DTUAPA@mail.gmail.com>
Subject: Re: [PATCH v4 21/49] perf python: Port event_analyzing_sample to perf module
To: sashiko-reviews@lists.linux.dev
Cc: linux-perf-users@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 25, 2026 at 11:34=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [High] perf python: SQLite journal symlink attack via shared temp direc=
tory
> --
>
> commit 69d795499ff20d3b762362308ad4405d0fa32d19
> Author: Ian Rogers <irogers@google.com>
>
> perf python: Port event_analyzing_sample to perf module
>
> This commit ports the event_analyzing_sample.py script to a standalone sc=
ript
> using the perf module and standard library sqlite3. It adds database
> encapsulation and argparse options, while removing Python 2 compatibility
> and adding type annotations.
>
> > diff --git a/tools/perf/python/event_analyzing_sample.py b/tools/perf/p=
ython/event_analyzing_sample.py
> > new file mode 100755
> > index 0000000000000..15b47cff9fa30
> > --- /dev/null
> > +++ b/tools/perf/python/event_analyzing_sample.py
>
> [ ... ]
>
> > +def trace_begin(db_path: str | None =3D None) -> None:
> > +    """Initialize database tables."""
> > +    print("In trace_begin:\n")
> > +    if not db_path:
> > +        fd, db_path =3D tempfile.mkstemp(prefix=3D"perf_events_", suff=
ix=3D".db")
> > +        os.close(fd)
> > +        _DB.temp_path =3D db_path
> > +    con =3D sqlite3.connect(db_path)
>
> [Severity: High]
> Can this sequence open a race window for symlink attacks via SQLite journ=
al
> files?
>
> When tempfile.mkstemp() creates the main database file in the shared /tmp
> directory, it doesn't reserve paths for SQLite's auxiliary sidecar files
> like -journal or -wal.
>
> If a local attacker monitors /tmp and observes the newly created base fil=
ename,
> could they immediately create a symlink for the -journal file pointing to=
 an
> arbitrary target before sqlite3.connect() writes to it?
>
> If a privileged user runs the script without specifying a database path,
> would SQLite follow the symlink and clobber the target file when writing
> to the journal?
>
> Would it be better to use tempfile.mkdtemp() to create a secure private
> directory for the database (similar to export-to-sqlite.py)?

The legacy script hardcoded `sqlite3.connect("/tmp/perf.db")`, so
`tempfile.mkstemp()` was used here to avoid a fixed `/tmp/perf.db`
path when `--db` is not specified. Note that on Linux
`fs.protected_symlinks=3D1` and SQLite's `O_NOFOLLOW` when opening
journal/WAL files already prevent `/tmp` symlink clobbering, and when
`--db` is omitted the temporary database is unlinked in `trace_end()`.

Switching the default (no `--db`) path to use `tempfile.mkdtemp()` (or
`sqlite3.connect(":memory:")`) is a nice cleanup. If there is a v5
I'll add that fix to the series; otherwise, I'll send a small
follow-up patch once this series lands.

Thanks,
Ian

> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260926062029.80=
0743-1-irogers@google.com?part=3D21
