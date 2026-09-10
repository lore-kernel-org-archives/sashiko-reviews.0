Received: from mta0.migadu.com (out-164.mta0.migadu.com [91.218.175.164])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7772F3DC4D9
	for <sashiko-reviews@lists.linux.dev>; Thu, 10 Sep 2026 11:12:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.164
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789038754; cv=none; b=qBFZG5ujaYdZA/l90T60MtFHD9jq29WRUAEkfL+nTPQI7GIMd6lXyRG0NlMGWs8zsSS65nKISbT79S/TvtlbNf9zWpxxUmDPaUcZpdm5TDs4hRSJkXNnzQVWAk+i8ob2zq/12j0qzxZtXvFXpUbOhdGiL9bquH7NPtX3NZlmZMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789038754; c=relaxed/simple;
	bh=jq/RS/dk3naU1gOXB97hhEYsKi0JENiPVr47YfqgDH0=;
	h=MIME-Version:Date:Content-Type:From:Message-ID:Subject:To:
	 In-Reply-To:References; b=JaSi944MAStWOkS42vz2fi6kTlfM5kWckOGaIQfweZNBlA8GB5szK+kJ+iosrDM+w+ctNxoM4cZhjv93s+1YLbUGr9vYX3tywIhdAyys24m485/KMQa/V1XmTAJ5mvjFIr6N/h97BH5z7JJv7jckJBjA5Xiouo3zETTUG4DJAtM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=ERDwXJpk; arc=none smtp.client-ip=91.218.175.164
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="ERDwXJpk"
X-Envelope-To: sashiko-reviews@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=jq/RS/dk3naU1gOXB97hhEYsKi0JENiPVr47YfqgDH0=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789038748; v=1; x=1789643548;
 b=ERDwXJpkr6zcqtEHD9XlFdwne7GnNCborcRNc663TE1yvGgF6MQESQ17/9R/YWPgTS9HqPhS
 aAnAhBEabhyav7yrenZTJicwbphwGlzUF6NyXQdCPqDFn+CnHUxTWaYdWGbMV4d0lufDaXyyTNl
 KOHZ5c2HuUcXTogrOSTouC/c=
X-Envelope-To: sashiko-reviews@lists.linux.dev
Received: by smtp.migadu.com with ESMTPS id 06e0ba7dfd8ba99a;
	Thu, 10 Sep 2026 11:12:28 +0000
X-Mizu-Trace-ID: 06e0ba7dfd8ba99a
X-Migadu-Flow: FLOW_OUT
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Thu, 10 Sep 2026 11:12:28 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
From: gang.yan@linux.dev
Message-ID: <4f0546488ae4245a08c7c7d4a1ff1c66dfaf4872@linux.dev>
TLS-Required: No
Subject: Re: [PATCH mptcp-next v6 5/6] Squash-to "mptcp: pm: init and release
 mptcp_pm_ops"
To: sashiko-reviews@lists.linux.dev
In-Reply-To: <20260904095005.34CA31F00A3D@smtp.kernel.org>
References: <20260904093531.20023-1-gang.yan@linux.dev>
 <20260904093531.20023-6-gang.yan@linux.dev>
 <20260904095005.34CA31F00A3D@smtp.kernel.org>

September 4, 2026 at 5:50 PM, sashiko-bot@kernel.org mailto:sashiko-bot@k=
ernel.org  wrote:


>=20
>=20Thank you for your contribution! Sashiko AI review found 1 potential =
issue(s) to consider:
> - [Medium] Contradictory claim in the commit message regarding module u=
nloading.
> --
>=20
>=20commit 954ec9b5378fa18a4b6badb35d44bfbe2edbd12a
> Author: Gang Yan <yangang@kylinos.cn>
>=20
>=20Squash-to "mptcp: pm: init and release mptcp_pm_ops"
>=20
>=20This commit introduces mptcp_pm_ops lifetime handling on sockets and =
per-net
> path managers. It modifies path manager initialization and cleanup rout=
ines
> to use operations structs directly and take module references.
>=20
>=20>=20
>=20> This commit introduces the mptcp_pm_ops lifetime handling on socket=
s
> >  (mptcp_pm_ops_init/release taking a module reference), and would the=
n
> >  be the first one whose per-net path managers can be unloaded while a
> >  pernet still stores them.
> >=20
>=20[ ... ]
>=20
>=20>=20
>=20> diff --git a/net/mptcp/ctrl.c b/net/mptcp/ctrl.c
> >  index 87491b961bf27..6379a9f481ac6 100644
> >  --- a/net/mptcp/ctrl.c
> >  +++ b/net/mptcp/ctrl.c
> >=20
>=20[ ... ]
>=20
>=20>=20
>=20> @@ -224,15 +222,22 @@ static int proc_blackhole_detect_timeout(cons=
t struct ctl_table *table,
> >=20=20
>=20>  static int mptcp_set_path_manager(struct mptcp_pernet *pernet, con=
st char *name)
> >  {
> >  - struct mptcp_pm_ops *pm_ops;
> >  + struct mptcp_pm_ops *pm_ops, *prev;
> >  int ret =3D 0;
> >=20=20
>=20>  rcu_read_lock();
> >  pm_ops =3D mptcp_pm_find(name);
> >  - if (pm_ops)
> >  - xchg(&pernet->path_manager, pm_ops);
> >  - else
> >  + if (pm_ops) {
> >  + if (bpf_try_module_get(pm_ops, pm_ops->owner)) {
> >  + prev =3D xchg(&pernet->path_manager, pm_ops);
> >=20
>=20[Severity: Medium]
> Does this code contradict the commit message regarding module unloading=
?
>=20
>=20The commit message claims that per-net path managers "can be unloaded=
 while a
> pernet still stores them." However, here in mptcp_set_path_manager() (a=
s well
> as in mptcp_pernet_set_defaults()), bpf_try_module_get() is explicitly =
called
> before storing the pm_ops pointer in the per-net structure.
>=20
>=20This increments the module's reference count, which fundamentally pre=
vents the
> module from being unloaded (e.g., via rmmod) as long as the netns uses =
it.
>=20
>=20Could the commit message or the implementation be clarified to resolv=
e this
> mismatch?

This seems an error in commit message, will fix in next version.

>=20
>=20>=20
>=20> + if (prev)
> >  + bpf_module_put(prev, prev->owner);
> >  + } else {
> >  + ret =3D -EBUSY;
> >  + }
> >  + } else {
> >  ret =3D -ENOENT;
> >  + }
> >  rcu_read_unlock();
> >=20=20
>=20>  return ret;
> >=20
>=20--=20
>=20Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/2026090409353=
1.20023-1-gang.yan@linux.dev?part=3D5
>
