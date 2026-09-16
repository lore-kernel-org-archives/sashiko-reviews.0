Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61980479886
	for <sashiko-reviews@lists.linux.dev>; Wed, 16 Sep 2026 21:39:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789594811; cv=none; b=U4SibEHP3avAAT7T95Z74ipU8dF0r/2AAG0QK+WRd2M1+UXzUB0iwPYImBlK0X4oM4ju8hJLfGITmC4SCDUna+Sm9cmxZS6RwqKaZF8oVQB1Ja7309MdOkAy3IDF/wmdRfjzcmBKqqBg7FPGmxD3uBg/8eFJH4XZdrOSymP933s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789594811; c=relaxed/simple;
	bh=eZVdUHmOSslZ4zBnvcc4bcwkIOdKveQiwIkLyiuidrk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EJUzxvtLrIh74GkCH9s5HDLS8lEJBeJb2qcfpthz2Ug3MaPluRe3g6YLoZybogPHmYUxJAeJyezm+rjYALc1cFiuSzx4pY0+lCO8bOmQ1r0tdYfD83nL5RmowYiLjFDPKo9fOR/pYj/mhc5DUbjGeqVFEo3KZiyqYirV1Qehq3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QwqXTiic; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QwqXTiic"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A31D31F0089B
	for <sashiko-reviews@lists.linux.dev>; Wed, 16 Sep 2026 21:39:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789594793;
	bh=eZVdUHmOSslZ4zBnvcc4bcwkIOdKveQiwIkLyiuidrk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=QwqXTiicEvh4BmP3ihP4NzZdZKUB2smoB5OAvsHRisqL9w14djYaAB3Qceb5b4xn+
	 hQnc60i3tsK1kiGjrawRBWE4LiFSm4JYTnyIS6/BQYfTJcWXZboDQrrZ115c8r5wVe
	 oFoikx2GsmbzdCxF0nJTInX7gQrjuOGjwweU/EHUVHaNUe67CU6/kxl7DbjFkeeLHJ
	 Ryk/PDRmOuAgBQynp6IDWfqmSMzPi37QURuzB+Tit6iiCZirgyIBXD4toOXttczVHC
	 XBSyN9JPhCSBqU110WoZgQn4hmjxl6DsAfhRcCha9hVUAUz2qbDRDR9p6H4+x9g11d
	 oCzhEIsVKzWjA==
Received: by mail-qk2-f13.google.com with SMTP id af79cd13be357-939109fafd6so11121985a.3
        for <sashiko-reviews@lists.linux.dev>; Wed, 16 Sep 2026 14:39:53 -0700 (PDT)
X-Gm-Message-State: AFuF++nRO3tK+dNUZAKvcL0ROHCbfTC5gVDAGjlW+dR4nzDGQ30NrklA
	5dKZBqZqcQxmlQjhbmeptRszHL1ac5Vw5XESUaCgfINaFtNa30KCtcQGRJY3kcdb6vGj28gbpiC
	eE7yN8U4bnKFUAzPPgyxEODz8glljkg0=
X-Received: by 2002:a05:620a:450e:b0:939:8373:b552 with SMTP id
 af79cd13be357-93bb76e6382mr692821585a.1.1789594792812; Wed, 16 Sep 2026
 14:39:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260916184351.2720310-1-song@kernel.org> <20260916184351.2720310-44-song@kernel.org>
 <20260916190039.E41211F00893@smtp.kernel.org>
In-Reply-To: <20260916190039.E41211F00893@smtp.kernel.org>
From: Song Liu <song@kernel.org>
Date: Wed, 16 Sep 2026 14:39:40 -0700
X-Gmail-Original-Message-ID: <CAPhsuW41jWTrbQZ6RwNPfgh7Ow4Lk8qgT-LwnRFy47puwXMyYw@mail.gmail.com>
X-Gm-Features: AcwNN1WX6yyrLZ981bKr8xbo9I24c6NIHrG8Uj6auM6KMkQOBSCg-UM2ciu9tpk
Message-ID: <CAPhsuW41jWTrbQZ6RwNPfgh7Ow4Lk8qgT-LwnRFy47puwXMyYw@mail.gmail.com>
Subject: Re: [PATCH v5 43/58] objtool/klp: Test rejection of a file-local
 static branch key
To: sashiko-reviews@lists.linux.dev
Cc: live-patching@vger.kernel.org, jpoimboe@kernel.org, pmladek@suse.com, 
	joe.lawrence@redhat.com, kernel-team@meta.com, puranjay@kernel.org, 
	peterz@infradead.org, mbenes@suse.cz, jikos@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 16, 2026 at 12:00=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Low] invalid AI attribution tags in commit message
> --
>
> commit 31c30fc01ab7bac006cdecfa960b5321f80c4604
> Author: Song Liu <song@kernel.org>
>
> objtool/klp: Test rejection of a file-local static branch key
>
> This commit adds a test to ensure that a static branch key owned by a
> module is properly rejected when accessed via a livepatch relocation. It
> adds a knob to cover file-local keys and verifies that the input referenc=
es
> the key through its section symbol.
>
> > Assisted-by: Claude:claude-opus-4
> > Based-on-test-by: Joe Lawrence <joe.lawrence@redhat.com>
> > Assisted-by: Claude:claude-opus-5
>
> [Severity: Low]
> This isn't a bug, but the commit message uses non-standard Assisted-by
> tags with pseudonyms and no valid email addresses. Should these attributi=
on
> tags be removed or replaced with standard trailer formats before submissi=
on?

I think the Assisted-by tag here is OK.

Thanks,
Song
