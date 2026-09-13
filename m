Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2D623932DA
	for <sashiko-reviews@lists.linux.dev>; Sun, 13 Sep 2026 12:15:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789301715; cv=none; b=Ar8fH12sznPDZJIZw4qHwvPBrnZam6p00Brdx3wujbOSK4hkNAk/xMz4DWuJA5ocvWrKnU/8hgOKcBES9cYPp+VCbbLl6+XpegBYGCrTMRvtVjW4iIK7xqP7VUYc6NI+TVZu6ZrmX0P8RYOOJdnU765HnmYuogO8OfsXiVWc3bM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789301715; c=relaxed/simple;
	bh=hKysyXX2c97twHFT+qB2lQTPpAk3w8xncJ/PJIlGA4k=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=VHhP1CLG/ahjN9KfAWu9gds3+QtDagvuVJQNtV2wxkpsZMQL1ILpq5i6w/d2dQOYaNsVwcc7IOWnL3iMcwtWzGC6229DcbrlVQ2F7MbrAeDtuSWpxM/NiAMGK4eRmJDoqcPqNJnySvsy8ARUiORA5bTZiPr9ferqST/5Kwf6MT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Dr2xfkQm; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Dr2xfkQm"
Received: by mail-pz2-f12.google.com with SMTP id d2e1a72fcca58-8631d0023daso534161b3a.2
        for <sashiko-reviews@lists.linux.dev>; Sun, 13 Sep 2026 05:15:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789301712; x=1789906512; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:message-id
         :references:in-reply-to:user-agent:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=lSoM6I1aPz9Shou4iumBlkD4AmDilJosmX4TmWduFSQ=;
        b=Dr2xfkQmd/9tjPdKU2xa37wGlUsIUOfgC3I4u1Co+cH+44HYSOQl+nW0Z4XT9sCHen
         DNGnCgne9qvtarBe4quPsVByiraaW0tocT+H+WORsiDZplCXDI3WzGTWhi7RiasNtPGF
         0Tl026hblTF1eNVaWSdgthjqXSq8uNXUksj+XNMZmAHGcNQgr8j0jQkou1zZnca89KFJ
         PGgZROchJISwUYZGAbtLhiAm0BsF/fIG/hyJRs63vgrsUtbfhjwoSstgi6hLV9y/4HI2
         jY/Kalal4iKQDVIRy+hm9DLIAJEC3w7rM72XHnkSYuiePXe5MP2PHItp2iXodvoNWgAs
         Llaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789301712; x=1789906512;
        h=content-transfer-encoding:content-type:mime-version:message-id
         :references:in-reply-to:user-agent:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lSoM6I1aPz9Shou4iumBlkD4AmDilJosmX4TmWduFSQ=;
        b=RwkWRkMiPu0tYwg2wtWlRny/8F1Ul7WF8IMXXVnp7/rPo2n8Ne3Z1Dlx9bke1Fmku+
         CrAgvqxI38c5JeknH51sa8wc9Gh85yC3n98NsdcH41c8Esom/+ZOvQ7gaycT+P7q9MCH
         iFEW53ZTGkgY+DnWYOa+CjNy/2q+oe3koqzWm0RvCafkkpM/FT+/Q3W1bZb+OYjUskW6
         Scu1/0N1h3SUBh0THUxH1EJFf3jszy99//JplwhLfi4gca5GtjJ+LPwvlwaDdsfshyQn
         Hsfg6zkf+qmAa+mdvdVC+u4xakhfloJkaeL5ET97IEdoLSnwEdp6Kg/5jZPbQDBBhCQ7
         wudg==
X-Gm-Message-State: AFuF++lUiTflXweFvlVbMiCw4rGmQS9dhwHNK64V4V5aEEW9SGTekdGD
	QyGyPwMqLvS2dZVu79872Irca2stF9ZtgyYo8Xden1Uo/x5mLLGqnhXOeHSWpjGG
X-Gm-Gg: AYBFou0BFFEi75Yiyxw102S6rZZAWr1CGn1Iif6/vRxUzcfDIjUSQwqUYoWuLA30n5s
	Yv8okHEtOesfuVYgwUSS/vC2ANq0p5wh/XtiSvAZeEN/1tMk5CafO6+0RWUwVAdJTbhtzfKlthu
	b0AlTw4Dj9cyV8w7hktCr63KexabqqfigYks1KxexSgy4zvEabEWV6m5QxX5yBGfTgAN7v500T1
	gGcRsyvLdZtNZ032CvhvH4u7be1agHm/ixBDNFDHFfcXzH9o37Lo5rgxK4y6MT8yikxiG81HXfO
	thIgliXdEC/VG+PiGG65ZZU1VGW5mX/JPNJ0nDJhhDLolqriJgAO0PQs6v83IrCqUnHntjRMukh
	rkBb369yna5PmVRVa16Yx7RVsVZoeEnrQWDpvRWQeygk2GjWol2O8lcR3UdxfCQhWSB07Pu0aa2
	KfE2JJfrCC7O3luZxqV1xh4e6INjTXwQcy9BJ8yt2X1ayqTN8mzMHR8bzFpcFgdBvWdqoD/SFaD
	GdF+NBM4269aKAg
X-Received: by 2002:a05:6300:670a:b0:3d1:af47:5f80 with SMTP id adf61e73a8af0-3db0e12bca1mr13678451637.11.1789301711879;
        Sun, 13 Sep 2026 05:15:11 -0700 (PDT)
Received: from ehlo.thunderbird.net ([2804:2bf0:60e7:ae00:fb55:7959:5b2b:8b1c])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4ed64fcsm21871662eec.16.2026.09.13.05.15.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 13 Sep 2026 05:15:10 -0700 (PDT)
Date: Sun, 13 Sep 2026 09:15:06 -0300
From: Arnaldo Melo <arnaldo.melo@gmail.com>
To: sashiko-reviews@lists.linux.dev, sashiko-bot@kernel.org,
 Arnaldo Carvalho de Melo <acme@kernel.org>
CC: linux-perf-users@vger.kernel.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v2_2/8=5D_perf_debuginfo=3A_Fetch_d?=
 =?US-ASCII?Q?ebuginfo_keyed_by_build_ID_using_debuginfod?=
User-Agent: Thunderbird for Android
In-Reply-To: <20260913033651.5686D1F00893@smtp.kernel.org>
References: <20260913032632.116277-1-acme@kernel.org> <20260913032632.116277-3-acme@kernel.org> <20260913033651.5686D1F00893@smtp.kernel.org>
Message-ID: <F4EDF3EC-ABDE-43E8-A343-DE710D636211@gmail.com>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable



On September 13, 2026 12:36:50 AM GMT-03:00, sashiko-bot@kernel=2Eorg wrot=
e:
>Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
>- [Medium] Time-of-Check to Time-of-Use (TOCTOU) race condition in debugi=
nfo__find_build_id() leading to redundant network fetches and memory leaks=
=2E


Ack, fixed in V3, will post later today=2E=20

- Arnaldo

>--
>
>commit a2b8e0baf731e115b13a42e3b82a0348a1a8851a
>Author: Arnaldo Carvalho de Melo <acme@redhat=2Ecom>
>
>perf debuginfo: Fetch debuginfo keyed by build ID using debuginfod
>
>This commit introduces the ability to fetch debuginfo keyed by build ID
>using the debuginfod client when it is not found locally=2E It adds mecha=
nisms
>for progress indication, user cancellation, and caching misses to prevent
>repeated network fetches=2E
>
>> diff --git a/tools/perf/util/debuginfo=2Ec b/tools/perf/util/debuginfo=
=2Ec
>> index 84a78b30ceac1=2E=2E6f3023c96375c 100644
>> --- a/tools/perf/util/debuginfo=2Ec
>> +++ b/tools/perf/util/debuginfo=2Ec
>[ =2E=2E=2E ]
>> @@ -139,6 +149,443 @@ struct debuginfo *debuginfo__new(const char *path=
)
>[ =2E=2E=2E ]
>> +int debuginfo__find_build_id(const struct build_id *bid, char **path)
>> +{
>> +	int err;
>> +
>> +	*path =3D NULL;
>> +
>> +	if (!build_id__is_defined(bid) || !symbol_conf=2Edebuginfod)
>> +		return -1;
>> +
>> +	if (debuginfod__cache_disabled()) {
>> +		pr_debug("Build-id cache disabled (buildid dir is '%s'), not using d=
ebuginfod\n",
>> +			 buildid_dir);
>> +		return -1;
>> +	}
>> +
>> +	if (debuginfod__missed(bid)) {
>> +		char sbuild_id[SBUILD_ID_SIZE];
>> +
>> +		build_id__snprintf(bid, sbuild_id, sizeof(sbuild_id));
>> +		pr_debug("Not searching build ID %s in debuginfod again, it was a mi=
ss earlier\n",
>> +			 sbuild_id);
>> +		return -1;
>> +	}
>> +
>> +	debuginfod__fetch_lock_init();
>> +	mutex_lock(&debuginfod__fetch_lock);
>> +	err =3D debuginfod__fetch(bid, path);
>> +	mutex_unlock(&debuginfod__fetch_lock);
>
>[Severity: Medium]
>Could this introduce a time-of-check to time-of-use (TOCTOU) race conditi=
on?
>
>If two threads concurrently call debuginfo__find_build_id() for the same
>build ID, both could check debuginfod__missed(bid) and symbol_conf=2Edebu=
ginfod
>outside of debuginfod__fetch_lock=2E=20
>
>After the first thread acquires the lock, completes the fetch, and record=
s a
>miss (or processes a user cancellation), the second thread will acquire t=
he
>lock and unconditionally perform the same fetch again without re-evaluati=
ng
>the conditions=2E This could lead to redundant blocking network requests,
>ignored cancellation requests, and duplicate entries added to the
>debuginfod__misses list=2E
>
>> +
>> +	return err;
>> +}
>

- Arnaldo 
