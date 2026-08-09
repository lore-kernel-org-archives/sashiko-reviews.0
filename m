Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 847933C3BF7
	for <sashiko-reviews@lists.linux.dev>; Sun,  9 Aug 2026 09:40:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786268430; cv=pass; b=ktaHBU4aeScRzgjXPyMl53cFsKO5FYckyLJzFQNeZoTU9pKOxY20N+FGy6gTwHJO1E947NSeC/SXFCwG195CKu6+MbC7wtcBCxb+SbWhtJvOHAWaEQswJLMjEWxx99qJUn0Ml/hGpmmmBDUNii3mVNE57p57qkLd2Kv+XMPxf4I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786268430; c=relaxed/simple;
	bh=IjAXkoa2oScEt51YbbIBHg8pXYHsVgq8o76+T3S43fE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TZadx4/lmFzsJrIsApuvs0DlYFo+c1XhyBrR3cTLtd9GujNCVXcyE+Ukk74CuXNEM+xjpGBGO7Z8N9Vq00lMB8iXZ8DItjQw9ZhllKjYseWALTHbSpXYCqS/W1b2q3YwBoYMYmeK/COre7s9rEJYOZSbxJR6ydlUm1zGpIlNS18=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TcTJ9kKA; arc=pass smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TcTJ9kKA"
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-8201447e8cdso15919747b3.3
        for <sashiko-reviews@lists.linux.dev>; Sun, 09 Aug 2026 02:40:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786268417; cv=none;
        d=google.com; s=arc-20260327;
        b=TD5JHVTChydj1stQtPzDqnK3y/mbzcOKn0S/5BgSUksRZHVriwN+DOiHPAtKLF5zfS
         ZSUhXCibC1Yo/iUoWS8697qb0SkepoLnTFNLE+b4POUm5FLt+r2mm+ajAYDnc3QUkvb/
         C+JN6pMmpcUhf/Oxher1M+4tgwWxnEGqSH/pOIfb7dkIRp5MXhZ6o01yANo1JxhhCP+h
         ++E5MAN21mEGiPAXqupUFbPKPryZdCCm3dJxHhDrqDUaF1yagFGq8N1DVZ43hg/DqniA
         xk2+Q9ZQ0Xq2t9+K+epGu5GIsM4Dz20ZrJnJf97JZN8Xv3QMzIFdB2Ny6MckvvrHon/p
         0aeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9KkcD4cNkJ7R3VcW+5XtLvUJk0Z7zp7MozqiVoOmiAA=;
        fh=nUziL5HcIDthtMNN5QWbRI4LVZgATpaDHhY2cAFkFMw=;
        b=pWQXBpWgdeU6M6YxCJHbFaEk8pNDJ/c0tRozUHZwyiqU2qzoLqzKzvhh9/CZBguDkx
         7vz1s6/OKc89KA+dNcLFx+mFDTgavco+uHXbggzGyVik50R9YR/Q2fL5VEeW4WpN9u2+
         rHoHZJkemM5ES55f2lKxV+gIr7+JF2ZRUMnxYaoAN4sTVUoB9o9lKzqFjmOWTIfYlzVX
         +I7p5El4vDebebZi5yV1QlheB5IPQPv3+APBxaYZn2wJ1+NcDrYSa8NGw89P6ZFNz+uJ
         qo1QRvLp3BUgt5xBo/Ds2Db/c9sZWz0fEQ5smjj+q6K5iYE+qyzACRfmW7jb+tzbG85h
         iDUw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786268417; x=1786873217; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9KkcD4cNkJ7R3VcW+5XtLvUJk0Z7zp7MozqiVoOmiAA=;
        b=TcTJ9kKAgB91vC+VZNMD642GdNwgvYoBpKYpIvzrOlDoUQxrLvRJvqX+ycrGjPFbtO
         jjtj30tDkkZ19zpzb/ndBXEjzlAoUmLrNiDlkK4Ad0bY2k89Ni56lDzQUCMYL3gncYxs
         xCPkt1dE5O0QeyUv+pDHaWtFCiset7ZvhjrFGaZl8p6Qq2vXx2f+eZ46M2YlHPTNf093
         I/GfY+8GL6TKkFc+V0nnshBFkNepw/w1cKig4RvPI+Iwi59rilYmjrTQcYql+nJ7G0Wm
         y3+iaxSQK1Zuqrrgr5f+z+6V5njvPJPLRHEje9akaX4NMwv84crbQ4cfqgB+/2gpxAcK
         KnOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786268417; x=1786873217;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9KkcD4cNkJ7R3VcW+5XtLvUJk0Z7zp7MozqiVoOmiAA=;
        b=rv36JdVFgJXyP3oG1UCz9Jw7cb79/jIMIjpu8+0MuNzfVwten6fKJDMi9WOzRUKNv7
         FO6YRxGMNlzQoTo+yvp8q7uxEGJJhdyvHMwsemaFy8gnAACmOQaQvCn9yXdoSPFih84D
         aouasYcNOSTP+5+TABX9Puu6HUi1Xsat1+HI9cFI7Qw2Et1edJaBqA6VOqtA91ZQa0/3
         EzNv1hdItfI/JTRpEwSjpgW9cTUVy2AG9Ak3LqQViW95qWwNSb6EZnlDtu+7tfDgtzpU
         2hT1PXmVbtUc98c78u7fGyzIxQqJe9em9Lqv1VPSQCFWV44WRbHtIwALrXNHRzI7i9IJ
         C4GA==
X-Gm-Message-State: AOJu0Yxp/QmS/OnJP/1+FoAwyRyijOVL7Ckn8MwS6/unPxPEMWpAhrrK
	GyWQnXtjzuSme++jetHaoEo0ynxzuVaHWPOJWt0lM/MY4zU9EJFyfClVkRc7GsLEBi+JITLG/T/
	5iR5n7XycrA4Ui/Oaviq0Bqrrwc4FckYkPF2FaVSs5Q==
X-Gm-Gg: AR+sD10rhc8KmL36MQPnOqY9grU7QYE81uCAd5G6N/pJpDpYUHYQ10dY1+76CAK6CNQ
	q0FD0n0EPwEkqPJvfUkC8RjOsQ9//4RMwwqMlATXFrrxVbbKtd6JBzdmlpIRGiYoeI5/zYIjEPe
	u+9wKmUw8uBpbrUzv95UVnnlxVq93qa6XLi2B/3m42L7dbqy6heyn8c/DndvagdQ/NDnrodeNR1
	wZbu4bqU6I1X/hGw7b7Fi+btJdfg29ab1Q6NkV+zwvqNjH5liAr2Jsm4jVXAx71Uk6cf3QJgdcA
	gRHl0OYZOdsYmHyo5QD6yNicYFPoeBFQXa1L49IgtONtUoTVfkYi3cnSPflt2kwZI6z0H5cTl1z
	hrA==
X-Received: by 2002:a05:690c:650c:b0:80c:8d09:3880 with SMTP id
 00721157ae682-8201f4a69bbmr219060497b3.15.1786268417150; Sun, 09 Aug 2026
 02:40:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260809091954.22930-1-laoar.shao@gmail.com> <20260809091954.22930-3-laoar.shao@gmail.com>
 <20260809093214.169491F000E9@smtp.kernel.org>
In-Reply-To: <20260809093214.169491F000E9@smtp.kernel.org>
From: Yafang Shao <laoar.shao@gmail.com>
Date: Sun, 9 Aug 2026 17:39:41 +0800
X-Gm-Features: AUfX_mwUPu4woBnmXuZZQ4trLTtU2ir7H6J_5FcX9RQDxlEWhKZkLdiT5BpUUpE
Message-ID: <CALOAHbB0nfrtSvV5m8DY3OBYu_6ugrJ=thtGyO+0KtVQtsTwUg@mail.gmail.com>
Subject: Re: [PATCH v5 2/9] livepatch: Make klp_find_func() non static
To: sashiko-reviews@lists.linux.dev
Cc: jpoimboe@kernel.org, mbenes@suse.cz, song@kernel.org, 
	joe.lawrence@redhat.com, pmladek@suse.com, jikos@kernel.org, 
	live-patching@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 9, 2026 at 5:32=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
>
> Pre-existing issues:
> - [High] A malformed livepatch module with a missing `old_name` triggers =
a NULL pointer dereference in `klp_find_func()`.

Invalid review issue.
This issue was already resolved by commit:

  livepatch: Fix NULL pointer dereference in klp_find_func()

https://git.kernel.org/pub/scm/linux/kernel/git/livepatching/livepatching.g=
it/commit/?h=3Dfor-7.3/trivial&id=3D1a38fd13c31ed8e7c7b598cc975ecc0f41fca46=
8

--=20
Regards
Yafang
