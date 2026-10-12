Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFDED440627
	for <sashiko-reviews@lists.linux.dev>; Mon, 12 Oct 2026 08:05:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791792312; cv=none; b=fZFRlFvkWYjELurpzFRAUBufGLFhDECfF1l0EoD1j4yYSMHGIbANIiJN+nLW/biPTcKDNRMTQ+0Iso2waV/RhP8aWN5snuuV8jLS+h2/n3XaYKJrAsc3LeaJZLiFpKZxc8X+BIKqhXWbvV2HUTFxEKg1fUsy3KHkCMUo/Qf5AJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791792312; c=relaxed/simple;
	bh=fBwpQrscKG2MNu6DtML6mpRhuMqbND/8kAIqBtzxt70=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KA4K+2CZ1oWwyHWTdJO23j3K0CeaA2KwPZQjgMcUKcuOCZ5qlfpl78DMFG6HJmwfre+GprtScS8ja/JVIe57JEHbR2e1hntLis3ULpyj/ooi71VqQ8mjsZhlot2Az7uHJYHxvC846klBvJaoGTy+o3btSoVAqQ8+nrG41Hr9Nxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dyKP/1RQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dyKP/1RQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75A731F0089B
	for <sashiko-reviews@lists.linux.dev>; Mon, 12 Oct 2026 08:05:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791792311;
	bh=fBwpQrscKG2MNu6DtML6mpRhuMqbND/8kAIqBtzxt70=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=dyKP/1RQx3ArMyGVqDcXNAppN/owjaT1MS2VjY/Nse6XeLef9vaodufU76h0NgM2c
	 y2uklV6DlG2YlK1OV1okEVyjbFSP20EpdMh0l/2yolHpxora210x5qNEydfuXQ28/z
	 chUAJGF9jfEFH3Jm2eR1GT2r9hcNqAFkPvYkinC/sGrXRyCesdx0wVjkYXOMMUGnKQ
	 jy6Hip6BWQoN0lCmBXVmjMrGi6QVQueMtg3CK3V9FATvLJ1GTEHu03rYZ2XAc+uMxe
	 7lZhhXmdW0PqqjnHF8Uu7JI8oG2WcH2XPWCrnNl2aiqSSys+5KGghkog/UwTPx1O5W
	 eqCiq81tzuVng==
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-3a5a26c8412so15881141fa.3
        for <sashiko-reviews@lists.linux.dev>; Mon, 12 Oct 2026 01:05:11 -0700 (PDT)
X-Gm-Message-State: AFq9FYK7u2TNPPTbn2WelnGbE37+5MEn6C8ZEc3ygzUbrKSgK3/0B4BU
	aIFNp4/++VezEvfcGjyD9tRp2vUnfbZYMy2kUakG/XKjnGaoNMtxMsxvOiD9cmTNL1JgdbWSaah
	xDN+f445RqWEoPSbMbglRA4KQiW2deRA=
X-Received: by 2002:a2e:a9a3:0:b0:3a9:a2fd:5931 with SMTP id
 38308e7fff4ca-3a9c55db070mr18556191fa.6.1791792310210; Mon, 12 Oct 2026
 01:05:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20261012015433.6155-1-phucduc.bui@gmail.com> <sashiko-outbox-167547@kernel.org>
 <CAABR9nHKxOze0wryK1XjSdJVA7rsMXiSt=-S8W2QsGdQqP1Evg@mail.gmail.com>
In-Reply-To: <CAABR9nHKxOze0wryK1XjSdJVA7rsMXiSt=-S8W2QsGdQqP1Evg@mail.gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 12 Oct 2026 10:04:58 +0200
X-Gmail-Original-Message-ID: <CAD++jLkwM6KY-DsYU5-rJSisX17OwNzcq6xNrrw7uRkRCbEcYg@mail.gmail.com>
X-Gm-Features: AclHuK8NzHYGDfIcjnpzczSW68YihUIiM9-DfvkM2k3b8qWCvW0U7vvOxNAQ2k4
Message-ID: <CAD++jLkwM6KY-DsYU5-rJSisX17OwNzcq6xNrrw7uRkRCbEcYg@mail.gmail.com>
Subject: Re: [PATCH v2] pinctrl: mcp23s08: Propagate reset GPIO errors
To: Bui Duc Phuc <phucduc.bui@gmail.com>
Cc: sashiko-reviews@lists.linux.dev, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 12, 2026 at 7:53=E2=80=AFAM Bui Duc Phuc <phucduc.bui@gmail.com=
> wrote:

> Linus, could you confirm whether this approach would be OK for
> mcp23s08?

I don't understand Sashiko's fringe use-case rambling here,
I think the patch is fine.

Yours,
Linus Walleij
