Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78BC2401A0A
	for <sashiko-reviews@lists.linux.dev>; Tue, 25 Aug 2026 12:10:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787659846; cv=pass; b=TkGKUJBM/jGB4ewcRKV76QBj1UUUB7gLPWm1JUx8GVOCtdFtSxEdPIHVaduKoSbWDsXOIuEm65jEfrn1qoi6Tirji38+7br3ZKsezsgp5AogvsrKnu9im2PTiQ/6aZfG2aUyqWW3UzumfhLn5iNgC92OaG2SKf20/h3FI0SX0zk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787659846; c=relaxed/simple;
	bh=kJ9hrWQedvb79ipaVMOGn2vkaw9mO7jS+bNOdzYa/Ss=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ib8OF/ZacA2hXjCLKodrzys+8WKdrWFGJlU6Mb8pS6TEYp4XUsp2roPYWkHhpxZQJ91PMtOUwBIiJ30bWoifuaPwTPxB1DBMg0ztuIYzMnKixUuEzZODwnGaXZiAc8iv+0RZY2GcOwdTjxyiEQKBiu8YLNi3cg4dc66Kurjd8Xs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LWRVDmjq; arc=pass smtp.client-ip=209.85.128.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LWRVDmjq"
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-836ce6cbe1eso67235867b3.1
        for <sashiko-reviews@lists.linux.dev>; Tue, 25 Aug 2026 05:10:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787659844; cv=none;
        d=google.com; s=arc-20260327;
        b=SK2HXHQox2S2YFtppmsj2dxd315ZwdQk1xmYTcfaOflbg5SStk7jUvwp65IWJapzCF
         /T8+Hnwh1WY2rYUG/5v2aa+bUIJNr4t6/Tn3/jkFJA/K2cYMGyull4W+B25oV5OQy95w
         SBdO/swzUpfm+UCWKi8V+4u7yw2YMiuZwvNlCLEgyW/sUXUsoa3202nLBhI3zt/Q0EXD
         1e0b5N38ewjcmK0moy7NYzW88vQ8O3/2ibNKMRqlI4W1Ld6SuLTe1yZxbBFI1XvoWoHg
         SR9epBxoc+Uv68qU1VtkgLpoyQUO2+/urrDrThWbQBUNAs//kDvxONjSGKZa6aQmcr7z
         6bUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kJ9hrWQedvb79ipaVMOGn2vkaw9mO7jS+bNOdzYa/Ss=;
        fh=wzIjvSGmjLs+/q285zguamRmv+TLlu4WF7jdwujDeAc=;
        b=Xx+PWJLalhMmobQjANHL8WQ5XoVN7l9cLdj7aij/FZd9kUdz1hLiZA1MVlB49G7iHP
         vKO9Pw8qvsU0oyere6SKu6hZ0us/p7yc554cJJN+IoGE0c/wIP+D0QSIPMKEnaCmbIOL
         zMGjn81duJcZ4aq6TegRog3p2g7tvzCeQUjs9+ItPMsTRvcopr9JBl10BYDD+EWlZpv7
         IeJmfz4jhbcQSMTaVQNhlmI5J3AghDjc9CJ38HnM9GJJfoOHJpNLpNzBq3UbuyrWnT7M
         JYToD1OxsXtZCl/oTsesHOMRDx1geyRH5mTSA6DC/xL9Kqfmy6YJbImJe+K3h2nveOVo
         ARjA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787659844; x=1788264644; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kJ9hrWQedvb79ipaVMOGn2vkaw9mO7jS+bNOdzYa/Ss=;
        b=LWRVDmjq8eCgoSDxCp3aoHN18IiliyiEeulV29ZxCFa7btsN9P3zb0i0yBYj85W3by
         Z+z4aBEb4FGYNNUQk2TPew1O7I3dfeyN4Sdy/8rGS5Wt5EIKkAseTpSrOvVuJvNtu96M
         vyfqj7Zp5xLcMyHVFC+/QB1IG1ZLxlYrXoXzKWQYU6DgF/0JMB0MitDlwwMDHG+Wsd3/
         q50T7Q0aRB7dRjn7K0DVut5jpoFOyZwyPDKZV7pkSJKOXl6riG6q2QOLhSDDbR6rJdgn
         ka0Q2cEbTZ/utu7wHZyc2y7q6IZksa5wGQgPMz7xtlofXr+wwUqY/9IiOW+UNzzhldjL
         BvXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787659844; x=1788264644;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kJ9hrWQedvb79ipaVMOGn2vkaw9mO7jS+bNOdzYa/Ss=;
        b=AKc+appJ13gWNM2bORygc9tNwbzx6Y+P0pTEL70NvbkSI/14zJqh8m+k4ncg9OCnm8
         kRpRNtV4PcS5K1qDrzC9OVtE2WLXGE/Uc8nmHBhzni9vwOADYaKT1b9+Lb/XhK6RoRaQ
         YNK+Mn3pmt6M2U5ALwhHzG4fdJMDdlrXo0OPg+rngP++dDdGo1DK11OnV3draMY4Vqus
         1ZKg7mAdT6XWoNw5ThrUBbYM6UnMUAgli/7PnavxXvDSzkXY/hEL2ISo8BIaLN1PE6ww
         cNcYP6YqJkJ/QL1juhAfJFENdbsK5oR53tIEvoPuuVDSvvXLelwTiaWJKVaChlv5+LiY
         +yrg==
X-Gm-Message-State: AFuF++lG2wA0a+YEkgnC+0cIZHW901Fxmxqxrq1yEjK6o2GCKpnABvz3
	292fRzg1hhMHpuCt9G1cvQl6ru8MAw+36AtjuwsWI6QysMAYgz04WvEvo+IU78167zHjlhhcXjw
	wR1kkFByaUYDUuk6kLAMpsDNOduw50nTrttYPAFE=
X-Gm-Gg: AR+sD1255wrjz3lSBkBDO8eLZpni/B/gw7HRxzpyHH33pbuOWaaQ5cdMK6N8p+q8xN3
	Y7aP6Utuhed1gOu6IHAbExFgsgLVFqxPseLq8soT3Q2qeWJ0ZO+CitVMpD+rzSOeYM7iEl3nbnI
	eNI4Ur8Fpy/D6sl0byTyKARCHz/PrfpOBVMF9uad8uXpYXT5FWw5YRHYo4w4uBoZBGwRjqRU6Qr
	95S8hf2MXxa0W5YCW9t7MEWgL8vApwBfqIRRaDV41g54fhSWYWK+hwZE54h6E0QsZ9tna6ZPRX1
	3/z0Y/kMvIeCN+lTfqLt2KYuWFNsGcvLLOLsblFx3dGxC36DdkQoSyuHtWvvLQk1QYgs7VkkVn9
	3LA==
X-Received: by 2002:a05:690c:660a:b0:7ff:1a93:be35 with SMTP id
 00721157ae682-849f2453bf8mr135633127b3.16.1787659844109; Tue, 25 Aug 2026
 05:10:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260825114641.80452-1-laoar.shao@gmail.com> <20260825114641.80452-4-laoar.shao@gmail.com>
 <20260825115949.50A6E1F000E9@smtp.kernel.org>
In-Reply-To: <20260825115949.50A6E1F000E9@smtp.kernel.org>
From: Yafang Shao <laoar.shao@gmail.com>
Date: Tue, 25 Aug 2026 20:10:08 +0800
X-Gm-Features: AcwNN1UuC7F10aj4YHVAMkQvoflardyEu4XV_wVleTpEOQfCZEfcg6pMaNlgGIM
Message-ID: <CALOAHbB99x=RxEmpqiwD+Z1F9BDUTr4gPEGHdT2zM8FfHOtupQ@mail.gmail.com>
Subject: Re: [PATCH v7 for-next 3/8] livepatch: Implement replace set for
 scoped atomic replace
To: sashiko-reviews@lists.linux.dev
Cc: mbenes@suse.cz, jpoimboe@kernel.org, joe.lawrence@redhat.com, 
	pmladek@suse.com, song@kernel.org, jikos@kernel.org, 
	live-patching@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 25, 2026 at 7:59=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Medium] Contradiction between documentation/commit message and actual =
code regarding the 'obsoletes' list.

Ah, the provides ID is not included in the obsoletes list.
I will update it.

--=20
Regards
Yafang
