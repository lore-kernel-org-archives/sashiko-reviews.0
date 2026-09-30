Received: from mail-yx2-f40.google.com (mail-yx2-f40.google.com [74.125.224.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7FF81FDA61
	for <sashiko-reviews@lists.linux.dev>; Wed, 30 Sep 2026 03:30:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790739039; cv=pass; b=cSydmqGqdt22HfDgR4huh3Cqrwlj4qYWEUa999aL9tsTf/YkfkyNtZb8aD1U9g+Ju9xjZsqvheiFBMFR+6AWmIe/woPR73sU25mATVjeriwV3mJl0nEquYMjnCHH/fHixxiYmOKCgidWJ551Q1Ez1+1RQFf8WULxAiKEj6QI2FI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790739039; c=relaxed/simple;
	bh=63h2jRpyI+1NH923VQI2q86vk+ew88Ebv7NZcuaSHTM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WibAgYFF6IXu3oLinYD6VosbIRS/aRlEkhyfJQuy/urWPQrNRknDORzH+C6KfE5rhd+fBjup9opULXOdU/aSr8BFZ/oCS5S0ns/+UmjLTrgYqug7HQzg7g0qyBSF4TDl4NWTpb3qfwFpCaxKdWPIn58rwmCpj2Cuke/F1OjYzGU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m0dSdP5B; arc=pass smtp.client-ip=74.125.224.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m0dSdP5B"
Received: by mail-yx2-f40.google.com with SMTP id 956f58d0204a3-675686b026dso540600d50.1
        for <sashiko-reviews@lists.linux.dev>; Tue, 29 Sep 2026 20:30:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790739037; cv=none;
        d=google.com; s=arc-20260327;
        b=l4SQ1xEj9P4aPlcrfsEPkisVJ+PD5DvRl8mwRUDtGv++RHEM0s041Msjc8IDgnCbgd
         7nb2cFaHbzsxGjODaxFdc1+LIANYbiizt438R6S/EEFCDHATHzw8P6F5TF19l0P6AxiY
         uhzgR7HBXfUwWzExQnmXeXxErBVQylbby6ZhUJx8BFF67BxwhadHVJ7J+g8ogcEtC6xb
         aJBexho67PW64WuCsea+zH1CTrBoI9CX4B/2C98q5z9rt01/ny3Nh0kyytp5oq2mZtaW
         55ezdWJUSeJ2Z4mHLYY3X6ahmw8TLQMyN9nI83Goc86Tmscfj0hL3HNkB66o+Ld/V4Rp
         G0jA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=63h2jRpyI+1NH923VQI2q86vk+ew88Ebv7NZcuaSHTM=;
        fh=k04sE059R+9tLto974HXJNfEvsyZGYUYPkOTh37LyR0=;
        b=Zt6oHo/oO/nC1woIUjkyWYfIakhGh7WJlM47ALA+J4d2haY0oiFxtJtssGfdTN2TEV
         fN1cVLxvD7N/btU4cqptXBL0V781yBvikwwP3Q6g2h8H80gEcgU9NuZk9VjR2DNlMEnu
         BFZVNn5X1awIAQcEtIDsK7w8IjfujAbM1S0VTYJ/0QeWC/dLu26FaR5rt9eE+uqfE6sh
         zMt3+vzQEtegX0q4QeTAbzsaAWaxS3Jc5vA5N7KLUm5Xbee0pAjEJemyduOkymrfaLou
         3BUqbKB43dTWwajJWyNXa5p/nrgA7sEpS8zkXhwzV9Xr71XgtkFKt/pOsyAV2+I7FrOP
         9/ng==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790739037; x=1791343837; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=63h2jRpyI+1NH923VQI2q86vk+ew88Ebv7NZcuaSHTM=;
        b=m0dSdP5BsHBzrp1xb7TYAdr+l4l7f7eXTG5r241UKseEKzhGY/R5x44teBshgQK6D0
         bVBd19LKoIXeN9oksJT6bXQt1qrkDMLWtfgGnRqYC5Qr9A7E5T7anWaLm8YzVgClLHuJ
         pfHSC9SJkatk2D/rlog40OQpDVQyaUQboAH6mdZvXWRUGnuMtoLG4TR1HQFjqZVS8m51
         h+39su6uifSnvosMPb9CRNdefrfQbcoTj5QSqTZIBJQqLpr5kyBW92NO7mSAG8QcG8WU
         2Hs5bUyWHOXRzrxLbnyOh1ilpPzQI+tV0fMse7UlCoE5e+A0bthlhJx39UveYeMK3zdA
         5bbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790739037; x=1791343837;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=63h2jRpyI+1NH923VQI2q86vk+ew88Ebv7NZcuaSHTM=;
        b=1gE2ocguiCJyJqOeWhsjv0V5e4bhMI7AOhdNRybmcigEVHJqCFejc6AHJaZHPACqlp
         ytIuUBtnJApz2sAeNzb0KvvpBGhA3dPMR7ZiPmB/7ODJLrKg3J2H9HGRpM8IFqst4PIX
         j5w51HBGAUAfizYh/cfGfOEjreqomAulPpWiMjGxp/M49JdQF6d2ULSCunKvANjNrd/p
         fQvjAWZHiSLE4cLTjR4/q+lTXfh1yTxsU7SgkQjrKOfwqN8gJziOsJxuBvSq8DsZtHwX
         bzPOjL851JAUOkov0Z7B8tYnMY9gL9DTENLFLsTj9XTYDJJdkCP8QUcmjXvEaCSq4jBM
         8sAg==
X-Gm-Message-State: AFq9FYJy6b3zuW9H6XSjGUqaan7nd7zMGGaqNIbWYz+Y/HHMR7Q5QlRL
	raFeQsYmAQRljKrUq9The9QQvRQykfZUZ+i7FGoVCjqX9tEpQJ9ajOomvHpp5yWa61nLm6kaA06
	tEO1zGI0OkF4cAnSkrQIfAj8WAY/hyfAQfihW
X-Gm-Gg: AYBFou30bTnE5G9uF6eJjTERJQ5a134N2sL/6gktXN89wU42uejkBh/JDRFbol/K6I/
	tJJOh8tQsQdyhOMkZQ38PjurzjWYrUyoP+QARKxwVeVBK/SC+wm256x7hLXIC7QMtisriECB3fo
	S5sigZx6O8ekOLSZ+BPEvgK3UVuUBf9hXo3l/pCMv/05z1dRbWGbTBEnw5ynxAKNq6hd5RdCWDy
	0QoUxTcQDUo5nY+XDkQ6rHIShJ8FgHhzQUhqnThlpjdglVwE25xP/copq4oE84cglWjDL8dNd+s
	xRrJWD69b2+W2AKBN+nPTSxG0kG+le3HPDr/28aqxbIoUpijOxbuArdc7djoMJ/x0lT3MWQI8mM
	b90nr5E2dOw==
X-Received: by 2002:a05:690e:1686:b0:675:3dfb:41aa with SMTP id
 956f58d0204a3-676838404demr64196d50.16.1790739036829; Tue, 29 Sep 2026
 20:30:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260930030323.14396-1-laoar.shao@gmail.com> <20260930030323.14396-8-laoar.shao@gmail.com>
 <20260930031358.8C7611F000FF@smtp.kernel.org>
In-Reply-To: <20260930031358.8C7611F000FF@smtp.kernel.org>
From: Yafang Shao <laoar.shao@gmail.com>
Date: Wed, 30 Sep 2026 11:29:59 +0800
X-Gm-Features: AclHuK-cQZ3A5hHINIoMvk7iQUtahzNO9_m454roXPXhodRMviOcAfc0GZgB5GI
Message-ID: <CALOAHbBm066Sv+w6gs-eWfX5zagXV3im59S9xRwtP46+4mQBzA@mail.gmail.com>
Subject: Re: [PATCH v10 7/9] selftests/livepatch: Add provides/obsoletes test scenarios
To: sashiko-reviews@lists.linux.dev
Cc: jikos@kernel.org, mbenes@suse.cz, pmladek@suse.com, 
	joe.lawrence@redhat.com, song@kernel.org, jpoimboe@kernel.org, 
	live-patching@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 30, 2026 at 11:13=E2=80=AFAM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Low] selftests: comment mismatch in obsoletes test

Nice catch.
I will update it.

--=20
Regards
Yafang
