Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E0EB3F1AAD
	for <sashiko-reviews@lists.linux.dev>; Thu, 17 Sep 2026 05:21:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789622499; cv=none; b=gMdE2/oa3Fol3+RrG5/+P/DUhLqU6bLS5EjnhQSmPLpon6AT9MMM4cLsr3xzJ+e2Zo2O9VbdPiJH9bQaAXjJcsG/p67/UIbDjxZIvPKMw0zcC01EROxP8U+f3p7Ur/CACyWDwJbeQdfwmkxS1vnJvpKUWcvCCmD94Yu/Dwml2XI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789622499; c=relaxed/simple;
	bh=ncpSYBZfy6fSP05xt/exBsegjUDdGuio3Ya9NjqO+nU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=usq7HrWEQUfxKss4h5bw4RNTK2v/PrG2OOb1hkV6jM9OsCSP/VlfYPO5lO4GJpb6mDylPhKQF3HBmTJ2Y4kkrHwHY6mHhw1iFvQCt8wMT/cXjdzuKqM8PZPUan/Npoiir1E8+hBdUHQliFT9L5AQ3sZYlRhyhNGYR46FOFJVwak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UaMxodg8; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UaMxodg8"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-398b3b189e0so340673a91.2
        for <sashiko-reviews@lists.linux.dev>; Wed, 16 Sep 2026 22:21:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789622498; x=1790227298; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wI0n1pAgEv0aYYQLyLwZm2yEnSd1ksUhBTNoBJK2fUc=;
        b=UaMxodg830WNxfCTQSh8f/h/Mb8+Nu6ejgSnLhkQgTo+h+lkJv9v76LbxviA0LIrsh
         l/eNU0XTeZeVAyn+11SxinlXvwJEd3d/UPDDeUh6iPflNyzmSdp1ILjw1xs5BODas61C
         Ggz0+rppnkUPwFdvF1uGZfEUS37QfXL4t8MkJLVaUh48PnVR/uYJeAx5BKPZxHOUv7sl
         /QblyvACx9N37IovOfIdNbft6VyiWAkqFQg5ljaZcnT7U3ssYNcAOjiKIz7hlBBfSlNx
         LQNgml+ZD3wa0X8LSxxSp0l3mPtehOyHesmwlj1ehA2Y/KLqS/vKFTVdsiuKyN62Ydif
         9zNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789622498; x=1790227298;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wI0n1pAgEv0aYYQLyLwZm2yEnSd1ksUhBTNoBJK2fUc=;
        b=a9tmMJy0D+KukqbU1xROmlveSR5spwFZEalsbKy+1X2tjhFECBPuYWIFATnDUFfyE9
         Hy3Fns7V4gih6/v2LTTDhEawOioVFYqQ924pRQyHEh2uh/Q01celJpvIbbHe4xpqUeMc
         N26eVXkfzW0eZ+wG/WeCqkn75ec9VoDPTw28CJFjMibDXqq9Ox0YvREQpG0jb5o7NxEK
         BeByWryhyuFt0hZE2oj1em2O+c0rifhwSiIWBmaL3m9xWP3m/pSVtfyEzQZ1VpedIjtx
         0Zpe5Fc/EH2pJ/hsGg9fOurv4QeBsvkvuOPXbdov7qDgCm+sm2OMgAOIkqBPoH7BxThv
         hyOQ==
X-Gm-Message-State: AFuF++lsZEUBvFR8y0dqog5/T3HSrQtS/uSBRbyTdFPqqtRsjp+C1z2a
	zo7TA3L7zA9xSm7EeAMkq7a+ALqXfKhNKVTW7Azs2SE9tsA4xd/M8NYjq1/Wwf0=
X-Gm-Gg: AYBFou1zZaaeXDEOEdvhmFGKRtv0SBE3BItkzpv1gN5WJcxv6UVJFPaUbSP9PN4VH1k
	QIDlmiPHJoSMyq3TjkJLalLquAbkB5bxu46Nm7TDJ8ga5YrX+Lh53n/0/OmWBNcS4GxBYRJGujt
	vkXCSu6QLiypD6kIBGv8dlRa+fD4PXVXrT/Zwoiob0aYhZdHlFosRF0jE4zt8MupWPQLm7mxaIL
	451LR3o5NpLFyF1XYMZwnWIeShQYRK1U7SGQwvJd37ZJoh7RvgH2Uanfq8kr28a/egYjSXxkmQ5
	J8KmzQV3KIACaaC8M8Fy0+pmId2KSOxakw8xDcE2TwRZYaUeTfxf/IzMaMsklcL2fJAg9MLv6u3
	oryN9qsIy1Z5z9cJHEh4WrAkUtd+a6MWOAz/0vXmh95/1XEUrP+Vb4L3emKFLGJ9cJSWwNZf2gV
	9KTnIkU5A1EMtwpeXv2y/iI6WrJTaZj/hflVWoMCLiWnLLkjSARTKr6GyfmjgUL356VEDX9vSV8
	zNjiruBVKTzSZW9ImC9Hgus3XjitEBv+g1aodI=
X-Received: by 2002:a17:90b:39af:b0:398:c315:fa6f with SMTP id 98e67ed59e1d1-39e1e45cbd1mr11380577a91.14.1789622497706;
        Wed, 16 Sep 2026 22:21:37 -0700 (PDT)
Received: from ydg-Zenbook-14-UM3406GA ([2001:2d8:7f00:8c85:b6f9:c198:e14b:34c1])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e3abada87sm1916280a91.14.2026.09.16.22.21.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 22:21:37 -0700 (PDT)
From: Donggeun Yoo <donggeunyoo.kernel@gmail.com>
To: sashiko-reviews@lists.linux.dev,
	Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>
Cc: Donggeun Yoo <donggeunyoo.kernel@gmail.com>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Namhyung Kim <namhyung@kernel.org>,
	Tom Zanussi <zanussi@kernel.org>,
	linux-trace-kernel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/4] tracing: Print the bucket size as unsigned
Date: Thu, 17 Sep 2026 14:21:30 +0900
Message-ID: <20260917052130.371970-1-donggeunyoo.kernel@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260914054614.82A9B1F000FF@smtp.kernel.org>
References: <20260914053443.981201-1-donggeunyoo.kernel@gmail.com> <20260914053443.981201-2-donggeunyoo.kernel@gmail.com> <20260914054614.82A9B1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Mon, 14 Sep 2026 05:46:14 +0000, sashiko-bot@kernel.org wrote:
> [Severity: High]
> This isn't a bug introduced by this patch, but does the unsigned division
> in hist_field_bucket() break the bucketing logic for negative numbers?
>
> If the field is signed and negative, its 2's complement representation is
> large. Performing unsigned division via div64_ul() or an unsigned cast
> without checking hist_field->is_signed seems like it would calculate the
> remainder incorrectly. This would happen whenever a histogram is configured
> with buckets over a signed field that takes negative values, mapping them
> to the wrong bucket intervals.

Yes, and the two other issues in this mail are real as well. The 32-bit
truncation in DEFINE_HIST_FIELD_FN() and the one in hist_field_log2() are
posted:

  https://lore.kernel.org/all/20260917015532.103081-1-donggeunyoo.kernel@gmail.com/
  https://lore.kernel.org/all/20260917023834.216893-1-donggeunyoo.kernel@gmail.com/

This one I have not posted. When I went to write it, it turned out to need
more change than either of those, and I would rather hear what people think
of the approach first.

What it looks like today. The largest multiple of ten that fits in a u64 is
2^64 - 6, so with .buckets=10 over a signed field the groups below zero are
-6..-1, then -16..-7, then -26..-17: none of the boundaries fall on a
multiple of ten and the group next to zero holds six values. At the end of
the range the two ends meet. S64_MAX and S64_MIN are 9223372036854775807
and 9223372036854775808 unsigned, and both divide down to
9223372036854775800, so one group holds both.

One detail in the report is off. hist_field->is_signed is 0 on a .buckets
key even over a signed field. create_hist_field() takes the modifier
branch, copies size and type from operands[0] and stops. hist_debug on
"keys=arg.buckets=10" over an s32 field prints

  type: s32 ... is_signed: 0

The member that does carry it is hist_field->field->is_signed, which is
already what create_tracing_map_fields() passes to tracing_map_cmp_num() to
pick the sort comparator - so the tree orders such a key signed today while
grouping and printing it unsigned.

The rendering half of that is posted separately:

  https://lore.kernel.org/all/20260917045918.370993-1-donggeunyoo.kernel@gmail.com/

What I have for the grouping:

 - Take the signedness from hist_field->field->is_signed, so the grouping,
   the sort and the rendering all come from one place.

 - For a negative value, round toward negative infinity instead of dividing
   the two's complement. Boundaries then stay on multiples of the size on
   both sides of zero, so .buckets=10 groups -10..-1 and 0..9.

 - Clamp the lowest group at S64_MIN. The boundary below it is not
   representable in the u64 a key is stored in, so that group is short,
   the same way .buckets already has a short group at the top of an
   unsigned range. Its printed end has to come from the true boundary
   rather than start + size - 1, or it overlaps the group above it. With
   .buckets=10 it prints as

     { arg: ~ -9223372036854775808--9223372036854775801 } hitcount: 2

   and the next group starts at -9223372036854775800. With a size that
   divides 2^63 nothing is short.

 - Print the range signed, which cannot be done on its own: rendering
   today's grouping signed would name a range that does not contain
   S64_MIN.

Three things I would like an opinion on.

Should .buckets interpret signedness at all? histogram.rst says "in general
the semantics of a given field aren't interpreted when applying a modifier
to it", which reads against this. On the other side, the sort comparator is
already chosen from field->is_signed, so the tree does interpret it, just
not for grouping.

Is the short group at S64_MIN acceptable? I do not see a way to avoid it
that keeps the boundaries on multiples of the size, and anchoring the grid
at S64_MIN instead puts zero inside a group.

Is this a fix or a change? It alters what .buckets prints for any signed
field holding negative values. No ftrace selftest uses .buckets, but it is
still visible output, so I am not sure a Fixes: tag is the right framing.

I have it written and measured against three arms in QEMU if an RFC posting
would be more useful than this description.

Thanks,
Donggeun
